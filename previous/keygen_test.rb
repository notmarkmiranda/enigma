require_relative 'testing_header'
require_relative '../lib/keygen'

class Keygen_test < Minitest::Test

  def test_it_can_initialize
    e = Keygen.new("this is a message")

  end

end
