require 'minitest/pride'
require 'minitest/autorun'
require './lib/offset'
require './lib/enigma'

class OffsetTest < Minitest::Test

  def test_class_exists
    assert Offset
  end

  def test_can_receive_key_and_date
    e = Enigma.new
    date = Date.new(2016, 02, 16)
    e.encrypt("hello world", "12345", date)
    assert_equal "hello world", e.message
    assert_equal "12345", e.key
    assert_equal date, e.date
  end

  def test_creates_random_number_and_todays_dateif_none_passed_in
    e = Enigma.new
    e.encrypt("Hello World")
    assert_includes 10000..99999, e.key.to_i
    assert_equal Date.today, e.date
  end

  def test_can_format_key_into_four_element_array
    e = Offset.new("23456")
    assert_equal [23, 34, 45, 56], e.final_key
  end

  def test_can_format_random_key
    e = Offset.new
    assert_equal 4, e.final_key.size
  end

  def test_can_format_given_date
    e = Offset.new("12345", "160216")
    assert_equal 4, e.final_offset.size
  end

  def test_can_format_random_date
    e = Offset.new("12345")
    assert_equal Array, e.final_offset.class
    assert_equal 4, e.final_offset.size
  end

  def test_can_add_key_offset_together
    e = Offset.new("12345", "160216")
    assert_equal [18, 29, 39, 51], e.code
  end


end
