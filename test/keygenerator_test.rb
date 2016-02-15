require_relative 'test_header'
 require_relative '../lib/keygenerator'

class Keygenerator_test < Minitest::Test
  def test_it_can_format_key
    key = Keygenerator.new("12345", "021516")
    assert_equal [12, 23, 34, 45], key.format_key
  end

  def test_it_can_format_offset
    offset = Keygenerator.new("12345", "021516")
    assert_equal [8, 2, 5, 6], offset.format_offset
  end

  def test_it_can_add_offset_and_key_together
    key = Keygenerator.new("12345", "021516")
    assert_equal [20, 25, 39, 51], key.keygen
  end

  def test_it_create_its_own_date
    offset = Keygenerator.new("12345")
    assert_equal [8, 2, 5, 6], offset.format_offset
  end
end
