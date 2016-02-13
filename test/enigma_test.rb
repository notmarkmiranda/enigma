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
    output = e.encrypt("message", "12345", "021316")
    @complete_code

  end

end
