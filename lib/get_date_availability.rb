require 'uri'
require 'net/http'
require 'json'
require 'date'
require_relative 'api/api_detail'

module Availability
    Url = APIDetail::Url
    Headers = APIDetail::Headers_Date

    Uri = URI.parse(Url);

    $today = Date.today
    day = $today.day
    month = $today.month
    year = $today.year

    $day_after_year = Date.new(year+1,month,day)

    # check if date is between today and one year later and add it's availability in hash
    def self.process_date_availability(json_data)
        days = json_data.dig(0,'data','propertyAvailabilityCalendars',0,'days') || []
        date_available_one_year = {}
        days.each do |day|
            date = day['date'] || {}
            iterated_date = Date.new(date['year'],date['month'],date['day'])
            if iterated_date > $day_after_year
                break
            elsif iterated_date >= $today
                date_available_one_year[iterated_date.to_s] = day['available']
            end
        end
        return date_available_one_year
    end

    # make api request and call to process the response
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

    # take list of property info hash and merge with date availability hash up to one year
    def self.get_date_availability_from_list(list)
        count_for_logging = 0
        list.map do |property|
            date_available = check_availability(property[:'Listing ID'])
            count_for_logging += 1
            puts "count #{count_for_logging} : date availability processed for #{property[:'Listing ID']}"
            property.merge(date_available)
          end
    end
end