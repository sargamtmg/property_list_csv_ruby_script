require 'uri'
require 'net/http'
require 'json'
require_relative 'api/api_detail'
require_relative 'get_date_availability'

module FetchData
    Url = APIDetail::Url
    Headers = APIDetail::Headers

    Uri = URI.parse(Url);

    # extract only relevent information from response list
    def self.process_property_list(json_data)
        property_listings = json_data.dig('data','propertySearch','propertySearchListings') || []
        return property_listings.filter { |item| item['id'] }
            .map do |listing|
            {
                "Listing ID": listing['id'],
                "Listing Title": listing['headingSection']&.dig('heading') || "N/A",
                "Nightly Price": listing['priceSection']&.dig('priceSummary', 'displayMessages', 0, 'lineItems', 0, 'price', 'formatted')&.gsub("$", "") || "N/A",
                "Listing URL": listing['cardLink']&.dig('resource', 'value') || "N/A"
            }
            end
    end

    # Make an api request to fetch data and return list with pagination's next subset information
    def self.call_api(address,starting_index,page_size)
        http = Net::HTTP.new(Uri.host,Uri.port)
        http.use_ssl=true
        request = Net::HTTP::Post.new(Uri,Headers)
        payload = APIDetail.create_payload(address,starting_index,page_size)
        request.body = payload.to_json
        begin
            response = http.request(request)
            if response.code == "200"
                json_data = JSON.parse(response.body)
                property_list = process_property_list(json_data) 
                property_list_with_availabity= Availability.get_date_availability_from_list(property_list)
                next_subset = json_data.dig('data','propertySearch','pagination','subSets','nextSubSet') || nil
                puts "Success fetching list at starting index : #{starting_index}"
                return { property_list: property_list_with_availabity, next_subset: next_subset }
            else
                puts "HTTP Error: #{response.code}"
                puts "Fail to fetch at starting index : #{starting_index}"
            end
        rescue => error
            puts "Error: #{error}"
        end
        return { property_list: [], next_subset: nil }
    end

    # it call api iterativly and return total property list
    def self.fetch_list(address,page_size)
        starting_index=0
        property_list_data=[]
        while true
            page_detail = call_api(address,starting_index,page_size)
            property_list_data.concat(page_detail[:property_list])
            next_page_subset = page_detail[:next_subset]
            if next_page_subset.nil?
                break
            else
                starting_index = next_page_subset["startingIndex"]
            end
        end
        return property_list_data
    end
end