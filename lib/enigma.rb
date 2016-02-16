require_relative 'calculate'

require 'pry'
class Enigma
  attr_reader :message, :key, :date

  def initialize
    @character_map = [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encrypt(message, key=nil, date=nil, mode = "forward")
    @message = message
    @key = key
    @date = date
    Calculate.calc(key, date)
    Calculate.message_to_index(message)
  end

  e = Enigma.new
  e.encrypt("hello world", "12345", "021616")

end
