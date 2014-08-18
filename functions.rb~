functions

require 'readline'
require 'open-uri'



READING_TYPES = {
	"heathrowdata.txt" => "heathrow",
	"bradforddata.txt" => "bradford",
}

#ask the user (via the command line) to select a city they would like weather statistics for. currently there are only two cities (Heathrow or Bradford).


#ask the user (via the command line) for a single city


def query_user_for_city#Bradford or Heathrow
	puts"please choose a city Heathrow or Bradford: \n"
	city=gets.chomp
	if(city=='Heathrow' || city =='Bradford')
		puts "Thank you!! answer processing...."
		return true
	else 
		puts "\nAnswer should be either Heathrow or Bradford. Please try again"
		return false
		query_user_for_city
	end

end

def get_readings_from_remote(area)
	raise "invalid reading type" unless
	READING_TYPES.keys.inlude?(type)
  
	#read the remote file, split readings into a array
	base_url = "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/"
	url = "#{base_url}/#{area}"
	puts "Retrieving: #{type}"
	data = open(url).readlines

	#Extract the reading from each line
	# "2014_01_01 00:02:577.6\r\n"  becomes 7.6
	readings = data.map do |line|
		line_items = line.chomp.split(" ")
		reading = line_items[2].to_f
	end
	return readings 

#data calculations 
	def mean(array)
		total = array.inject(0) {|sum, x| sum +=x}
		#use to_f which will allow you to have a proper decimal number
		return total.to_f / array.length
	end
	def median(array)
		array.sort!  #exclamation mark will mean the sorted list will replace the old one
		length = array.length
		if length  % 2 = 1
			return array[length/2]
		else 
			item1 = array[length/2 - 1]
			item2 = array[length/2]
			return mean([item, item2])
	end
	def output_results_table(results)

#Given a city will go through all supported 
#READING_TYPES, retrieve values from the remote server,
#and calculate the mean and average of the values.
#Results are returned as a hash.
	def retrieve_and_calculate_results(type) #these are the two different factors
		results = {}
		READING_TYPES.each do |type, lable|
			readings= get_readings_from_remote(type)
			results[label] = {
				:mean => mean(readings),
				:median => median(readings)
			}
		end
		return results
	end
end
