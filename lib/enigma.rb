require_relative 'keygenerator'
require_relative 'rotator'

class Enigma
attr_reader :message, :key, :offset, :alphabet

  def initialize
    @alphabet = [*("a".."z"), *("0".."9"), " ", ".", ","]
  end

  def encrypt(message, key = nil, offset = nil)
  end

  e = Enigma.new
  p e.encrypt("abc def")
end
