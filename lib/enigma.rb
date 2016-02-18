require_relative 'key_generator'
require_relative 'offset'
require 'date'

require 'pry'

class Enigma
  attr_reader :message, :key, :date, :message_index, :shift, :encrypted_message

  def initialize
    @character_map = [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encrypt(message, key=nil, date=nil, mode = "forward")
    # refactor?
    magic_crypt_part(message, key, date, mode)
    puts "\"#{encrypted_message}\" was encrypted with the key #{@key} and date #{@date}"
  end

  def decrypt(message, key=nil, date=nil, mode = "backward")
    # refactor?
    magic_crypt_part(message, key, date, mode)
    puts "\"#{encrypted_message}\" was decrypted with the key #{key} and date #{@date}"
  end

  def crack(message, date=nil)
    @message = message
    @date = date || Date.today
    offset = Offset.new(nil, @date)
    # p offset.final_offset
    message_to_index(@message)
    p @message_index[-1]
    puts ". = #{@message_index[-1] + 2}" #39 - 37
    puts ". = #{@message_index[-2] + 2}" #39 - 37
    puts "d = #{@message_index[-3] + 36}" #39 - 3
    puts "n = #{@message_index[-3] + 26}" #39 - 13
    p @message.length % 4 - 1 #subtract 1 to get index position in ABCD
    # formula to determine first period index
    # (string length - 7 (length of ..end..) % 4 = index value for code)
    # put this into a variable, iterate 4 times increasing and modulo 4 and assign the array
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
  e.encrypt("hello ..end..", "12345", Date.new(2016, 02, 16))
  e.decrypt(" emqpmo3vi", "12345", Date.new(2016, 02, 15))
  e.crack("z7lx60.kwddkq", "160216")

end
