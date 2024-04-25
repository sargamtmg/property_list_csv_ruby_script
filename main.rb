require_relative 'lib/fetch_property_list'
require_relative 'lib/csv_generator'

address = ARGV[0]
page_size = ARGV[1].to_i

# validation for command line argument
if address.nil? || page_size.nil? || page_size<=0
    puts "Usage : ruby main.rb <address> <page_size>"
    exit 1
end

list = FetchData.fetch_list(address,page_size)
puts "length of total list: #{list.length}"
CSVGenerator.generate_csv(list,address)
