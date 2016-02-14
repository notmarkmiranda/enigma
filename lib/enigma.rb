require 'date'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 \  . ,)
  end

  def encrypt(message, key, date)
    format_the_key(key)
    format_the_offset(date)
    add_them_together

    # convert the message
    indexed_characters = []
    message.chars.each do |letter|
      indexed_characters << @alphabet.find_index(letter)
    end
    encrypted_message = []
    indexed_characters.map.with_index do |in_ch, i|
      if i > 3
        encrypted_message << (@complete_code[i % 4] + in_ch)
      else
        encrypted_message << (@complete_code[i] + in_ch)
      end
    end
    # STUCK HERE
    p @alphabet[encrypted_message[0]]
  end

  def decrypt
  end

  def crack
  end

# helper methods
  def format_the_key(key)
    @key = key
    split_key = @key.chars
    @final_key = []
    (0..3).each do |num|
      @final_key << split_key[num] + split_key[num + 1]
    end
    @final_key = @final_key.map do |key|
      key.to_i
    end
  end

  def format_the_offset(date)
    @date = date.to_i
    calc_date = (@date * @date).to_s
    calc_date = calc_date.chars[-4..-1]
    @final_offset = calc_date.map do |offset|
      offset.to_i
    end
  end

  def add_them_together
    @complete_code = [@final_key, @final_offset].transpose.map{ |x| x.reduce :+}
  end

  e = Enigma.new
  my_message = "abc def ghi"
  output = e.encrypt(my_message, "12345", "021316")
end
