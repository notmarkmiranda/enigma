require_relative 'key_generator'
require_relative 'offset'
require 'date'

require 'pry'

class Enigma
  attr_reader :message, :key, :date, :message_index

  def initialize
    @character_map = [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encrypt(message, key=nil, date=nil, mode = "forward")
    @message = message
    @key = key || KeyGenerator.create_key
    @date = date || Date.today
    shift = Offset.new(@key, @date)
    message_to_index(message)
    # Calculate.calc(key, date)
    # Calculate.message_to_index(message)
  end

  def message_to_index(message)
    message = message.chars
    @message_index = message.map do |letter|
      @character_map.index(letter)
    end
  end
end

if __FILE__ == $0
  e = Enigma.new
  e.encrypt("hello world", "12345")

end
