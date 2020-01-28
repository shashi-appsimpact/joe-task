# Read file:

file = File.open(your_file_path)

# Read first three columns(Day, Min Temp and Max Temp) from weather data file
columns = []

file.each_line do |line|
  columns << line.split(" ")[0 , 3]
end

# Remove empty elements from array
columns = columns.reject { |c| c.empty? }

# Removing the first element from array which is just heading
columns.delete(columns.first)

# Removing the last element from array which represents the avarage 
columns.delete(columns.last)

# Calculating the temperature spread on each day as a hash and inserting into array
day_temp_hash = []

columns.each { |day_arr| day_temp_hash << { day: day_arr.first, temp_spread: day_arr[1].to_i - day_arr[2].to_i } } 

# Spreaded tempratures oon each day
temprature_spread_diffs = []

day_temp_hash.each { |day_hash| temprature_spread_diffs << day_hash[:temp_spread]  }

# smallest spread temprature from the temprature spread all the day
smallest_temprature_spread = temprature_spread_diffs.min

# Resulting the day of month which has the minimum temprature spread
day_temp_hash.each do |day|
  if day.has_value?(smallest_temprature_spread)
    puts "Day #{day[:day]} has the minimum temperature spread, which is #{day[:temp_spread]}"
    break
  end
end
