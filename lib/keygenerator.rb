require 'date'

class Keygenerator
  attr_accessor :key, :offset, :code

  def initialize(key = nil, offset = nil)
    @key = key
    @offset = offset
    keygen
   end

  def keygen
    format_key
    format_offset
    add_them_together
  end

  def format_key
    generate_random_key if @key == nil

    @s_key = @key.chars
    @f_key = []
    (@s_key.size - 1).times do |num|
      @f_key << @s_key[num] + @s_key[num+1]
    end
    @f_key = @f_key.map do |key|
      key.to_i
    end
  end

  def generate_random_key
    @key = rand(10000..99999)
    @key = @key.to_s
  end

  def format_offset
    create_offset if (@offset == nil || @offset == Date.today)

    @offset = @offset.to_i
    @squared = @offset * @offset
    @f_offset = @squared.to_s[-4..-1].chars
    @f_offset = @f_offset.map do |offs|
      offs.to_i
    end
  end

  def create_offset
    @offset = []
    date = Date.today
    @offset << (date.mon).to_s + (date.mday).to_s + date.year.to_s[2] + date.year.to_s[3]
    @offset = @offset.join
  end

  def add_them_together
    @code = [@f_key, @f_offset].transpose.map{ |x| x.reduce :+}
  end

end
