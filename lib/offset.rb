require_relative 'key_generator'
require 'date'
require 'pry'

class Offset
  attr_reader :key, :date, :final_key, :final_offset, :code

  def initialize(key = nil, date = nil)
    @key = key || KeyGenerator.create_key
    @date = date || Date.today
    raise ArgumentError if @key.size != 5 && @key.class != String
    format_key(@key)
    format_offset(@date)
    add_them_together
  end

  def format_key(key)
    split_key = key.to_s.chars
    @final_key = []
    # permutations?
    (split_key.size - 1).times do |num|
      @final_key << split_key[num] + split_key[num+1]
    end
    @final_key.map!(&:to_i)
  end

  def format_offset(offset)
    offset = offset.strftime("%d%m%y") if offset.class == Date
    @final_offset = (offset.to_i ** 2).to_s[-4..-1].chars.map { |num| num.to_i }
  end

  def add_them_together
    @code = [@final_key, @final_offset]
    @code = @code.transpose.map { |value| value.reduce(:+)}
  end



end
