require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/keygen'

class Keygen_test < Minitest::Test
  def test_it_generates_a_five_digit_number
    key = Keygen.generate
    assert_includes 10000..99999, key
  end
end
