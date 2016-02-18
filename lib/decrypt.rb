require './lib/enigma'
require 'pry'

class Decrypt
  input_file = ARGV[0]
  key = ARGV[2]
  date = ARGV[3]
  message = File.read('./lib/' + input_file)
  e = Enigma.new
  e.decrypt(message, key, date)
  output_file = ARGV[1]
  File.write('./lib/' + output_file, e.encrypted_message)
  puts "Created #{output_file.inspect} with the key #{e.key} and date #{e.date}"
end
