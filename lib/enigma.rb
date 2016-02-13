require 'date'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 \  . ,)
  end

  def encrypt(message, key, date)
    #format the key
    @key = key
    split_key = @key.chars
    final_key = []
    (0..3).each do |num|
      final_key << split_key[num] + split_key[num + 1]
    end
    final_key = final_key.map do |key|
      key.to_i
    end

    # format the offset
    @date = date.to_i
    calc_date = (@date * @date).to_s
    calc_date = calc_date.chars[-4..-1]
    final_offset = calc_date.map do |offset|
      offset.to_i
    end

    #add them together
    code = %w(final_key, final_offset)
    complete_code = [final_key, final_offset].transpose.map{ |x| x.reduce :+}
  end

  def decrypt
  end

  def crack
  end

  e = Enigma.new
  my_message = "this is my message ..end.."
  output = e.encrypt(my_message, "12345", "021316")
  puts output
end
