require './lib/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test
  def test_class_exists
    assert KeyGenerator
  end

  def test_creates_a_random_key_of_five_digits_as_a_string
    key = KeyGenerator.create_key

    assert_equal 5, key.length
    assert_equal String, key.class
    assert_equal Fixnum, key.to_i.class
    refute_equal 0, key.to_i
  end
end
