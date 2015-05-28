filename = 'my_file.txt'

# File.new(filename, "w+") #creates the file

# File.open(filename, "w") do |file| #writes to the file
#   file.write("first line") # will override any text already there
# end


# File.open(filename, "a+") do |file| # append stuff to the file instead of writing over it
#   file << "another line\n"
# end

#str = File.read(filename) # just plain reads the file

str = File.readlines(filename).each_with_index do |line, index|
  puts "line #{index + 1}: #{line}" #print each line with a line number
end
