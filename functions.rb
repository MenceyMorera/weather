functions

require 'readline'
require 'open-uri'



READING_TYPES = {
	"heathrowdata.txt" => "heathrow",
	"bradforddata.txt" => "bradford",
}

#ask the user (via the command line) to provide vaid start and end date
#def query_user_for_date_range
#	start_date = nil
#	end_date = nil
#
#	until start_date && end_date
#
#	puts "\nFirst, we need a start date"
#	start_date= query_user_for_date
#
#	puts"\nNext, we need an end date."
#	end_date = query_user_for_date
#
#	if !date_range_valid?(start_date, end_date)
#		puts "lets tru again."
#		start_date= end_date =nil n
#	end
#
#	return start_date, end_date
#end

#ask the user (via the command line) for a single valid date
#used for both start and end dates.
def query_user_for_city
	prompt =("please enter a city of interest, either Heathrow or Bradford (type q, exit, q, x): ")
	area = gets.chomp.capitalize!
	until area.is?("Heathrow" or "Bradford")
		response = Readline.readline(prompt, true)
		#we have the option to quit at any time.
		exit if ['quit', 'exit', 'q', 'x'].include?(response)

		begin
			## need to enter entry rule
		rescue ArgumentError
			puts "\nInvalid city format."
		end

		area = nil unless date_valid(date)
			
#		end

#	end
#	return date
#end
def city_valid?(#Bradford or Heathrow)
	city_valid = Prompt.("please choose a city Heathrow or Bradford")
	if city_valid.cover?("Heathrow") or ("Bradford")
		return true
	else 
		puts "\nAnswer should be either Heathrow or Bradford. Please try again"
		return false
	end
end
#def date_range_valid?(start_date, end_date)
#	if start_date > end_date
#		puts "\n Start date must be before end date"
#		return false
#	elsif start_date + MAX_DAYS < end_date
#		puts "\nNo more than   #{MAX_DAYS} days, be kind to the server"
#		return false
##	end
#	return true
#end

#to retrieve data

#Retrieves readings for a paticular reading type for a range
#of dates from the remote server as an array of floating point
#values.
#def get_readings_from_remote_for_dates(type, start_date, end_date)
#	readings = []
#	start_date.upto(end_date) do |date|
#		readings += get_readings_from_remote(type, date)
#	end
#	return readings
#end
#	end
def get_readings_from_remote(type)
	raise "invalid reading type" unless
	READING_TYPES.keys.inlude?(type)
  
	#read the remote file, split readings into a array
	base_url = "http://www.metoffice.gov.uk/pub/data/weather/uk/climate/stationdata/"
	url = "#{base_url}/#{type}"
	puts "Retrieving: #{url}"
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

#Given a start date and end date,will go through all supported 
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