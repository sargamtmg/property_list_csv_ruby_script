require 'csv'
require 'fileutils'

module CSVGenerator
  def self.generate_csv(list,address)
      if !list.empty?
        folder_path = "listings"
        FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)
        timestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
        csv_file = File.join(folder_path, "#{address.gsub(" ","")}_#{timestamp}.csv")
        CSV.open(csv_file, 'wb') do |csv|
            # Append headers in csv
            csv << list[0].keys
          
            # Append property information in csv
            list.each do |property_detail|
              csv << property_detail.values
            end
        end
        puts "CSV file named #{csv_file} is generated"
      else
        puts "No list available for this address"
      end
  end
end