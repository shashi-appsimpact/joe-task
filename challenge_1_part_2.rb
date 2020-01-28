# Read file:

file = File.open(your_file_path)

# Read first three columns(Day, Min Temp and Max Temp) from weather data file
columns = []

file.each_line do |line|
  columns << line.split(" ")[0 , 9]
end

# Deleting the header part
columns.delete(columns.first)

# Remove the dashed line from the array because this not useful
columns = columns.reject { |c| c.include?"-------------------------------------------------------" }

# Remove team sequence number and '-' symbol from list and prepare a refined array:

refined_array = []

columns.each do |col|
  temp_arr = []
  temp_arr << col.reject! {|c| c.include?("-") || c.include?(".") }.first << col.last(2)
  refined_array << temp_arr.flatten!  
end

# Creating a collection of hashes of team and the goal_difference between for and against 
goal_temp_hash = []

refined_array.each { |refined| goal_temp_hash << { team: refined.first, goal_difference: refined[1].to_i  - refined[2].to_i } }

# Restoring the goal difference inside an array
for_and_against_goal_diffs = []

goal_temp_hash.each { |goal_hash| for_and_against_goal_diffs << goal_hash[:goal_difference] }

# smallest goal difference
smallest_goal_difference = for_and_against_goal_diffs.min 

# Resulting the team which has the smallest goal difference between for and against

goal_temp_hash.each do |goal_hash|
  if goal_hash.has_value?(smallest_goal_difference)
    puts "Team #{goal_hash[:team]} has the smallest difference in for and against goal, which is #{goal_hash[:goal_difference]}"
    break
  end
end
