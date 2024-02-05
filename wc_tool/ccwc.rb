require 'optparse'

options = {}


OptionParser.new do |opts|
  opts.on("-c", "--count", "Count bytes in file") do
    options[:count] = true
  end

  opts.on("-l", "--lines", "Count lines in the specified file") do
    options[:lines] = true
  end

  opts.on("-w", "--words", "Count words in the specified file") do
    options[:words] = true
  end

  opts.on("-m", "--characters", "Count characters in the specified file") do
    options[:characters] = true
  end
end.parse!
  
  
file_name = ARGV[0]

if file_name.nil?
  puts "Please provide a file name as a command line argument."
else
  if File.exist?(file_name)
    case 
    when options[:count]
      byte_count = File.size(file_name)
      puts "#{byte_count} #{file_name}"
    when options[:lines]
      line_count = File.foreach(file_name).count #foreach goes line by line
      puts "#{line_count} #{file_name}"
    when options[:words]
      word_count = File.read(file_name).split(/\s+/).count
      puts "#{word_count} #{file_name}"
    when options[:characters]
      character_count = File.read(file_name).chars.count
      puts "#{character_count} #{file_name}"
    else
      puts "Invalid option"
    end
  else
    puts "File not found"
  end
end

