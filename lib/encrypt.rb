require './lib/enigma'
require 'pry'


input_file = ARGV[0]

message = File.read('./lib/' + input_file)
message.chomp!
e = Enigma.new
e.encrypt(message)
output_file = ARGV[1]
File.write('./lib/' + output_file, e.encrypted_message)
puts "Created #{output_file.inspect} with the key #{e.key} and date #{e.date}"
