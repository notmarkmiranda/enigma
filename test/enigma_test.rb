require 'minitest/pride'
require 'minitest/autorun'
require 'date'
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_class_exists
    assert Enigma
  end

  def test_encrypt_uses_a_random_key_and_date_if_none_are_passed_in
    e = Enigma.new
    e.encrypt("message")
    assert_equal "message", e.message
    assert_equal 5, e.key.length
    assert_equal String, e.key.class
    assert_equal Fixnum, e.key.to_i.class
    assert_equal Date, e.date.class
  end

  def test_can_a_key_if_given
    e = Enigma.new
    e.encrypt("message", "12345")
    assert_equal "12345", e.key
  end

  def test_can_receive_key_and_date
    e = Enigma.new
    date = Date.new(2016, 01, 01)
    e.encrypt("message", "12345", date)
    assert_equal "12345", e.key
    assert_equal date, e.date
    assert_equal "message", e.message
  end

  def test_can_create_instance_offset_calculator
    e = Enigma.new
    date = Date.new(2016, 02, 16)
    e.encrypt("Hello World", "12345", date)
    assert_equal date, e.date
    assert_equal "12345", e.key
  end

  def test_can_convert_message_to_index
    e = Enigma.new
    e.encrypt("hello")
    assert_equal [7, 4, 11, 11, 14], e.message_index
  end
end
