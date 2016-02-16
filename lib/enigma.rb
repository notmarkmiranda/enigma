require_relative 'calculate'
require_relative 'key_generator'

require 'pry'
class Enigma
  attr_reader :message, :key, :date

  def initialize
    @character_map = [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encrypt(message, key=nil, date=nil, mode = "forward")
    @message = message
    @key = key || KeyGenerator.create_key
    @date = date || Date.today
    # Calculate.calc(key, date)
    # Calculate.message_to_index(message)
  end

  e = Enigma.new
  e.encrypt("hello world", "12345", "021616")

end
