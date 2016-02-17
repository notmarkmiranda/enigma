require_relative 'key_generator'
require_relative 'enigma'
require 'date'
require 'pry'
class Offset
  attr_reader :key, :date, :final_key, :final_offset, :code

  def initialize(key = nil, date = Date.today)
    @key = key || KeyGenerator.create_key
    @date = date || Date.today
    format_key(@key)
    format_offset(@date)
    add_them_together
  end

  def format_key(key)
    split_key = key.to_s.chars
    @final_key = []
    (split_key.size - 1).times do |num|
      @final_key << split_key[num] + split_key[num+1]
    end
    @final_key = @final_key.map do |num|
      num.to_i
    end
  end

  def format_offset(offset)
    if offset.class == Date
      offset = offset.strftime("%e%m%y")
    end
    @final_offset = []
    offset_int = (offset.to_i * offset.to_i).to_s[-4..-1].chars
    @final_offset = offset_int.map do |num|
      num.to_i
    end
  end

  def add_them_together
    raise ArgumentError.new("incorrect key value pairing") if @final_offset.size != @final_key.size
    @code = [@final_key, @final_offset]
    @code = @code.transpose.map { |value| value.reduce(:+)}
  end


end
