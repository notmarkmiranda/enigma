class KeyGenerator
  def self.create_key
    rand(10000..99999).to_s
  end
end
