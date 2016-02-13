require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/offset'

class Offset_test < Minitest::Test

  def test_it_can_convert_an_entered_date
    off = Offset.new(120681)
    assert_equal [3, 7, 6, 1], off.offset_calculate
  end

  def test_it_can_use_todays_date_if_no_date_entered
    off = Offset.new
    assert_equal [8, 6, 5, 6], off.offset_calculate
  end
end
