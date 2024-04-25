require 'uri'
require 'net/http'
require 'json'
require_relative 'api/api_detail'

module Availability
    Url = APIDetail::Url
    Headers = APIDetail::Headers_Date

    Uri = URI.parse(Url);

    def self.process_date_availability(json_data)
        days = json_data.dig(0,'data','propertyAvailabilityCalendars',0,'days') || []
        today = Date.today
        day = today.day
        month = today.month
        year = today.year
        day_after_year = Date.new(year+1,month,day)
        date_available_one_year = {}
        days.each do |day|
            date = day['date'] || {}
            res_date = Date.new(date['year'],date['month'],date['day'])
            if res_date > day_after_year
                break
            elsif res_date >= today
                date_available_one_year[res_date.to_s] = day['available']
            end
        end
        return date_available_one_year
    end

    def self.check_availability(property_id)
        http = Net::HTTP.new(Uri.host,Uri.port)
        http.use_ssl=true
        request = Net::HTTP::Post.new(Uri,Headers)
        payload = APIDetail.create_data_availability_payload(property_id)
        request.body = payload.to_json
        begin
            response = http.request(request)
            if response.code == "200"
                json_data = JSON.parse(response.body)
                date_availability = process_date_availability(json_data)
                return date_availability
            else
                puts "HTTP Error: #{response.code}"
            end
        rescue => error
            puts "Error calling date avalability api: #{error}"
        end
    end

    def self.get_date_availability_from_list(list)
        list.map do |property|
            date_available = check_availability(property[:'Listing ID'])
            property.merge(date_available)
          end
    end
end