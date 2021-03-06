heath_n_brad.rb
#!/usr/bin/env ruby

require_relative('functions')

puts "\n*** LAKE PEND OREILLE READINGS *** "
Puts "Calculates the mean  and median maximum air temperature for either Bradford or Heathrow since 1948"
puts "The results for 'Heathrow' come from the Heathrow (London Airport) station, Location 5078E 1767N 25m amsl"
puts "The results for 'Bradford' come from the Braford (London Airport) station, The results for 'Heathrow' come from the Heathrow (London Airport) station, Location 4149E 4352N, 134 metres amsl"

start_date, end_date = query_user_for_date_range

puts query_user_for_city
puts get_readings_from_remote(area)
puts retrieve_and_calculate_results(type)

