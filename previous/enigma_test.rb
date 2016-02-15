require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require 'pry'
require_relative '../lib/enigma'

class Enigma_test < Minitest::Test

  def test_format_key_creates_4_digit_array
    e = Enigma.new
    assert_equal [12, 23, 34, 45], e.format_the_key("12345")
  end

  def test_format_the_date_correctly
    e = Enigma.new
    assert_equal [1, 8, 5, 6], e.format_the_offset("021316")
  end

  def test_can_calculate_final_key
    e = Enigma.new
    e.encrypt("message", "12345", "021316")
    assert_equal [13, 31, 39, 51], e.add_them_together
  end

  def test_it_can_generate_a_random_five_digit_number
    e = Enigma.new
    e.encrypt("message")
    assert_includes 10000..99999, e.key.to_i
  end

  def test_it_can_generate_todays_date
  end

end
