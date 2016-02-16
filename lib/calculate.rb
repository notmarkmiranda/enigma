
class Calculate
  attr_reader :code

  def self.calc(key, offset)
    self.format_key(key)
    self.format_offset(offset)
    self.add_them_together
  end

  def self.format_key(key)
    @split_key = key.chars
    @string_key = []
    @final_key = []
    (@split_key.size - 1).times do |num|
      @string_key << (@split_key[num] + @split_key[num + 1])
    end
    @final_key = @string_key.map do |key|
      key.to_i
    end
  end

  def self.format_offset(offset)
    integer_offset = offset.to_i
    squared = integer_offset * integer_offset
    string_offset = squared.to_s
    string_offset = string_offset[-4..-1]
    string_offset = string_offset.chars
    @final_offset = string_offset.map do |offset|
      offset.to_i
    end
  end

  def self.add_them_together
    raise ArgumentError.new("incorrect key value pairing") if @final_offset.size != @final_key.size
    @code = [@final_key, @final_offset]
    @code = @code.transpose.map { |x| x.reduce(:+) }
  end

  def self.rotate(mode)

  end

  def self.message_to_index(message)
    split_message = message.chars
    
  end

end
