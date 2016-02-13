
class Keygen
  attr_reader :final_key

  def initialize(incoming_key = generate)
    @incoming_key = incoming_key
  end

  def generate
    @incomingkey = rand(10000..99999)
  end

  def keygen_calculate
    key_digits = @incoming_key.to_s.chars
    @final_key = []

    (key_digits.length - 1).times do |num|
      @final_key << key_digits[num] + key_digits[num + 1]
    end

    @final_key = @final_key.map do |num|
      num.to_i
    end
    @final_key = "TEST"
  end

key = Keygen.new
key.keygen_calculate

end
