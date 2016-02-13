
class Enigma
attr_reader :message, :key, :offset
# output = e.encrypt(my_message, "12345", Date.today)
  def initialize(message = nil, key = nil, offset = nil)
    @message = message
    @key = key
    @offset = offset
  end

  def encrypt(message, key = nil, offset = nil)
    p message
    p key
    p offset
  end

e = Enigma.new
my_message = "This is a secret ..end.."
output = e.encrypt(my_message)

end
