require_relative 'test_header'
require_relative '../lib/enigma'

class Enigma_test < Minitest::Test

  def test_it_can_initialize_with_a_message_key_and_offset
    e = Enigma.new("message", "12345", "021316")
    assert_equal "message", e.message
    assert_equal "12345", e.key
    assert_equal "021316", e.offset
  end


end
