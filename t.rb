
def city_valid?#Bradford or Heathrow)
	puts"please choose a city Heathrow or Bradford: \n"
	city=gets.chomp
	if(city=='Heathrow' || city =='Bradford')
		puts "Thank you!! answer processing...."
		return true
	else 
		puts "\nAnswer should be either Heathrow or Bradford. Please try again"
		return false
		city_valid?
	end

end

city_valid?
