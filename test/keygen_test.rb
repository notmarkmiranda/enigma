require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/keygen'

class Keygen_test < Minitest::Test

  def test_it_can_take_an_incoming_key
    key = Keygen.new(12345)
    assert_equal 12345, key.incoming_key
  end

  def test_keygen_calculate_splits_into_4_element_array
    key = Keygen.new(12345)
    assert_equal [12, 23, 34, 45], key.keygen_calculate
  end

  def test_it_can_generate_a_random_five_digit_number
    key = Keygen.new
    assert_includes 10000..99999, key.incoming_key
  end
end
