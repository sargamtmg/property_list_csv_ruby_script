require 'uri'
require 'net/http'
require 'json'
require 'date'
require 'concurrent'
require_relative 'api/api_detail'

module DateAvailability
    Url = APIDetail::Url
    Headers = APIDetail::Headers_Date

    Uri = URI.parse(Url);

    # todays and day after one year date initialization
    @@today = Date.today
    @@day_after_year = Date.new(@@today.year+1,@@today.month,@@today.day)
    

    # check if date is between today and one year later and add it's availability in hash
    def self.process_date_availability(json_data)
        days = json_data.dig(0,'data','propertyAvailabilityCalendars',0,'days') || []
        date_available_one_year = {}
        days.each do |day|
            date = day['date'] || {}
            iterated_date = Date.new(date['year'],date['month'],date['day'])
            if iterated_date > @@day_after_year
                break
            elsif iterated_date >= @@today
                date_available_one_year[iterated_date.to_s] = day['available'].nil? ? 'N/A' : day['available']
            end
        end
        return date_available_one_year
    end

    # make api request and call to process the response
    def self.check_availability(property_id)
        retries = 1 # number of retry attemp if End of file reached(EOFError) error encountered.
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
        rescue EOFError => e
            puts "Encountered EOFError: #{e.message}"
            
            if retries > 0
              puts "Retrying request for #{property_id}"
              retries -= 1
              retry
            else
              puts "Retry limit reached. for #{property_id}"
            end
        rescue => error
            puts "Error calling date avalability api: #{error}"
        end
        return {}
    end

    # take list of property info hash and merge with date availability hash up to one year
    def self.get_date_availability_from_list(list)
        # Create a thread pool with a fixed number of threads
        thread_pool = Concurrent::ThreadPoolExecutor.new(
          min_threads: 2,
          max_threads: 5
        )
    
        count_for_logging = 0
        results = []
    
        list.each do |property|
          # Submit a task to the thread pool to check availability for each property
          thread_pool.post do
            begin
              date_available = check_availability(property[:'Listing ID'])
              count_for_logging += 1
              puts "count #{count_for_logging} : date availability processed for #{property[:'Listing ID']}"
              results << property.merge(date_available)
            rescue => error
              puts "Error processing date availability for #{property[:'Listing ID']}: #{error}"
            end
          end
        end
    
        # Wait for all tasks to complete
        thread_pool.shutdown
        thread_pool.wait_for_termination
    
        results
    end
end