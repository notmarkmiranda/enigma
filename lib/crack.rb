require './lib/enigma'
require 'pry'

class Crack
  input_file = ARGV[0]
  date = ARGV[2]
  output_file = ARGV[1]
  message = File.read('./lib/' + input_file)
  e = Enigma.new
  cracked = e.crack(message)
  File.write('./lib/' + output_file, cracked[0])
  puts "Created #{output_file.inspect} with the key #{cracked[1]} and date #{e.date}"
end
