require 'optparse'

options = {}


OptionParser.new do |opts|
  opts.on("-c", "--count", "Count bytes in file") do
    options[:count] = true
  end
end.parse!
  
  
file_name = ARGV[0]

if file_name.nil?
  puts "Please provide a file name as a command line argument."
else
  if File.exist?(file_name)
    byte_count = File.size(file_name)

    if options[:count]
      puts "#{byte_count}"
    else
      puts "Invalid option"
    end
  else
    puts "File not found"
  end
end

