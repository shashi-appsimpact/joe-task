require_relative 'challenge_1_part_3'

file = File.open(your_file_path)

ReusablePart.read_file(file)
ReusablePart.get_file_columns(0, 9)
ReusablePart.delete_header_column
columns = ReusablePart.remove_dashed_line

# Remove team sequence number and '-' symbol from list and prepare a refined array:

refined_array = []

columns.each do |col|
  temp_arr = []
  temp_arr << col.reject! {|c| c.include?("-") || c.include?(".") }.first << col.last(2)
  refined_array << temp_arr.flatten!  
end

temp_hash_data = ReusablePart.get_temporary_hash_data(refined_array)

smallest_goal_difference = ReusablePart.smallest_difference_value(temp_hash_data)

temp_hash_data.each do |temp_hash|
  if temp_hash.has_value?(smallest_goal_difference)
    puts "Team #{temp_hash[:key_one]} has the smallest difference in for and against goal, which is #{temp_hash[:key_two]}"
    break
  end
end
