require 'date'

class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9 \  . ,)
  end

  def encrypt(message, key=nil, date=nil)
    format_the_key(key)
    format_the_offset(date)
    add_them_together
    convert_the_message_to_index(message)
    encrypt_shift
    convert_back_join
  end

  def decrypt(message, key, date=nil)
    format_the_key(key)
    format_the_offset(date)
    add_them_together
    convert_the_message_to_index(message)
    decrypt_shift
    convert_back_join
  end

  def crack
  end

# helper methods
  def convert_back_join
    @final_message = []
    @encrypted_message.map.with_index do |letter, i|
      @final_message << (@alphabet[@encrypted_message[i] % @alphabet.size])
    end
    @final_message = @final_message.join
  end

  def encrypt_shift
    @encrypted_message = []
    @indexed_characters.map.with_index do |in_ch, i|
      @encrypted_message << (@complete_code[(i % @complete_code.size)]+ in_ch)
    end
  end
  def decrypt_shift
    @encrypted_message = []
    @indexed_characters.map.with_index do |in_ch, i|
      @encrypted_message << (in_ch - @complete_code[i % @complete_code.size])
    end
  end

  def convert_the_message_to_index(message)
    @message = message
    @indexed_characters = []
    @message.chars.each do |letter|
      @indexed_characters << @alphabet.find_index(letter)
    end
  end

  def format_the_key(key)
    @key = key
    if @key == nil
      @key = generate_key
    end
    split_key = @key.chars
    @final_key = []
    (0..3).each do |num|
      @final_key << split_key[num] + split_key[num + 1]
    end
    @final_key = @final_key.map do |key|
      key.to_i
    end
  end

  def generate_key
    @key = rand(10000..99999)
    @key = @key.to_s
  end

  def format_the_offset(date)
    @date = date
    if @date == nil
      @date = create_date
    end
    @date = @date.to_i
    calc_date = (@date * @date).to_s
    calc_date = calc_date.chars[-4..-1]
    @final_offset = calc_date.map do |offset|
      offset.to_i
    end
  end

  def create_date
    @date = []
    today = Date.today
    @date.push(today.mon.to_s, today.mday.to_s, today.year.to_s[2], today.year.to_s[3])
    @date = @date.join
  end

  def add_them_together
    @complete_code = [@final_key, @final_offset].transpose.map{ |x| x.reduce :+}
  end

  e = Enigma.new
  my_message = "abc def ghi"
  e.generate_key
  p output = e.encrypt(my_message, "12345", "120681")
  p input = e.decrypt(output, "12345", "120681")
end
