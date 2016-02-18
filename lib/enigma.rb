require_relative 'key_generator'
require_relative 'offset'
require 'date'

require 'pry'

class Enigma
  attr_reader :message, :key, :date, :message_index, :shift, :encrypted_message, :temp_array

  def initialize
    @character_map = [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encrypt(message, key=nil, date=nil, mode = "forward")
    # refactor?
    magic_crypt_part(message, key, date, mode)
    @encrypted_message
  end

  def decrypt(message, key=nil, date=nil, mode = "backward")
    # refactor?
    magic_crypt_part(message, key, date, mode)
    @encrypted_message
  end

  def crack(message=nil, date=nil)
    @message = message
    @date = date || Date.today
    offset = Offset.new(nil, @date)
    0.upto(99999) do |key|
      temp_key = key.to_s.rjust(5, "0")
      temp_message = decrypt(@message, temp_key, @date)
      return temp_array = [temp_message, temp_key] if temp_message[-7..-1] == "..end.."
    end
  end

  def magic_crypt_part(message, key=nil, date=nil, mode)
    @message = message.downcase
    @key = key || KeyGenerator.create_key
    @date = date || Date.today
    @shift = Offset.new(@key, @date)
    @shift.add_them_together
    message_to_index(@message)
    rotate_and_return(mode)
  end

  def message_to_index(message)
    @message_index = message.chars.map do |letter|
      @character_map.index(letter)
    end
  end

  def rotate_and_return(mode)
    # refactor?
    e_message = []
    @message_index.each_with_index do |message, index|
      if mode == "forward"
        rotated = @character_map.rotate(@shift.code[index % 4])
      elsif mode == "backward"
        rotated = @character_map.rotate(-@shift.code[index % 4])
      end
      e_message <<  rotated[message]
    end
    @encrypted_message = e_message.join
  end

end

if __FILE__ == $0
  e = Enigma.new
  # puts e.encrypt("hello ..end..", "12345", Date.new(2016, 02, 16))
  # puts e.decrypt(" emqpmo3vi", "12345", Date.new(2016, 02, 15))
  puts e.crack("wogpbwi2hs4jcehoc.")

end
