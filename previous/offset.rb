require 'date'

class Offset
  attr_accessor :offset_key
  
  def initialize(incoming_date = use_today)
    @incoming_date = incoming_date
  end

  def offset_calculate
    squared = @incoming_date ** 2
    squared = squared.to_s[-4..-1]
    @offset_key = squared.chars
    @offset_key = @offset.map do |num|
      num.to_i
    end
  end

  def use_today
    @incoming_date = Date.today
    date = (@incoming_date.mon.to_s + @incoming_date.mday.to_s + @incoming_date.year.to_s[-2..-1]).to_i
  end
end
