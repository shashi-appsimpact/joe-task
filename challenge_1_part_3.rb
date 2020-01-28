module ReusablePart
  @@file = ""
  @@columns = []

  def ReusablePart.read_file(file_path)
    @@file = File.open(file_path)
  end

  def ReusablePart.get_file_columns(initial, last)
    @@columns = []
    @@file.each_line do |line|
      @@columns << line.split(" ")[initial , last]
    end
  end

  def ReusablePart.delete_header_column
    @@columns.delete(@@columns.first)
  end

  def ReusablePart.delete_footer_column
    @@columns.delete(@@columns.last)
  end

  def ReusablePart.usable_column
    @@columns
  end

  def ReusablePart.remove_dashed_line
    @@columns.reject { |c| c.include?"-------------------------------------------------------" }
  end

  def ReusablePart.remove_empty_element
    @@columns.reject { |c| c.empty? }
  end

  def ReusablePart.get_temporary_hash_data(collection)
    temp_hash = []
    collection.each { |collection_item| temp_hash << { key_one: collection_item.first, key_two: collection_item[1].to_i - collection_item[2].to_i } } 
    temp_hash
  end

  def ReusablePart.smallest_difference_value(temp_hash_data)
    temprature_spread_diffs = []
    temp_hash_data.each { |temp_hash| temprature_spread_diffs << temp_hash[:key_two] }
    temprature_spread_diffs.min
  end

end
