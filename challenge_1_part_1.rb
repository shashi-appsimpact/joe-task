require_relative 'challenge_1_part_3'

file = File.open(your_file_path)

ReusablePart.read_file(file)
ReusablePart.get_file_columns(0, 3)
ReusablePart.delete_header_column
ReusablePart.delete_footer_column
columns = ReusablePart.remove_empty_element

# Calculating the temperature spread on each day as a hash and inserting into array

temp_hash_data = ReusablePart.get_temporary_hash_data(columns)

smallest_temprature_spread = ReusablePart.smallest_difference_value(temp_hash_data)

# Resulting the day of month which has the minimum temprature spread
temp_hash_data.each do |temp_hash|
  if temp_hash.has_value?(smallest_temprature_spread)
    puts "Day #{temp_hash[:key_one]} has the minimum temperature spread, which is #{temp_hash[:key_two]}"
    break
  end
end
