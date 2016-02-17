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
    @message = message.downcase
    @key = key || KeyGenerator.create_key
    @date = date || Date.today
    @shift = Offset.new(@key, @date)
    message_to_index(@message)
    rotate_and_return(mode)
    puts "'#{encrypted_message}' was encrypted with the key #{key} and date #{date}"
  end

  def decrypt(message, key=nil, date=nil, mode = "backward")
    # refactor?
    @message = message.downcase
    @key = key || KeyGenerator.create_key
    @date = date || Date.today
    @shift = Offset.new(@key, @date)
    message_to_index(@message)
    rotate_and_return(mode)
    puts "'#{encrypted_message}' was encrypted with the key #{key} and date #{date}"
  end

  def message_to_index(message)
    @message_index = message.chars.map do |letter|
      @character_map.index(letter)
    end
  end

  def rotate_and_return(mode)
    # refactor?
    @encrypted_message = []
    @message_index.each_with_index do |message, index|
      if mode == "forward"
        rotated = @character_map.rotate(@shift.code[index % 4])
      elsif mode == "backward"
        rotated = @character_map.rotate(-@shift.code[index % 4])
      end
      @encrypted_message <<  rotated[message]
    end
    @encrypted_message = @encrypted_message.join
  end

end

if __FILE__ == $0
  e = Enigma.new
  e.encrypt("hello", "12345", Date.new(2016, 02, 16))
  e.decrypt(" emqpmo3vi", "12345", Date.new(2016, 02, 15))

end
