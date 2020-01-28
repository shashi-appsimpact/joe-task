class Alien
  require 'prawn'

  COLUMNS = ['Code Name', 'Blood Color', 'No.of Antennas', 'No. of Legs', 'Home Planet']
  FILE_NAME = 'alien-report'
  INPROCESS = "========================>  Please wait file is downloading <=========================="
  COMPLETED = "========================>      Downloaded Successfully      <=========================="
  DIRECTORY = "========================>      In the same directory      <=========================="

  def run
    @inputs = []
    COLUMNS.each do |column|
      puts "\033[40m\033[37m #{column} \033[0m\n"
      @inputs << gets.chomp
    end
    get_user_confirmation
  end

  def get_user_confirmation
    puts "\nAre you sure you want to export the file?"
    puts "Please Enter YES or NO\n"
    choice = gets.chomp
    case choice.downcase
    when 'yes'
      get_file_format
    when 'no'
      puts 'Thanks....'
    else
      puts 'Ivalid Choice'
    end
  end

  def get_file_format
    puts "\nPlease Enter File Format"
    puts "1) txt"
    puts "2) pdf"
    puts "3) Add new file format by: New\n"
    file_format = gets.chomp
    case file_format.downcase
    when 'txt'
      create_common_file('txt')
    when 'pdf'
      create_pdf_file
    when 'new'
      get_new_file_format
    else
      puts 'Invalid File Format'
    end
  end

  def get_new_file_format
    puts 'Please Add New File Format'
    new_format = gets.chomp
    create_common_file(new_format)
  end

  def extract_data_for_file
    COLUMNS.each_with_index.each_with_object([]) do |(column, index), data|                                                             
      data << "#{column}: #{@inputs[index]}"
    end
  end

  def create_common_file(file_format)
    puts INPROCESS
    file = File.open(FILE_NAME + '.'+file_format, 'w')
    file.puts extract_data_for_file
    file.close
    puts COMPLETED
    puts DIRECTORY
  end

  def create_pdf_file
    puts INPROCESS
    Prawn::Document.generate(FILE_NAME+'.pdf') do |pdf|
      extract_data_for_file.each {|text| pdf.text text }
    end                                                           
    puts COMPLETED
    puts DIRECTORY
  end
end

puts "This is a console application for Aliens on Earth "
puts "\nPlease enter the following details of alien"
alien = Alien.new
alien.run