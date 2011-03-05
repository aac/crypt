require 'crypto'

class User < ActiveRecord::Base
  has_many :values
  attr_accessor :password
  
  before_validation do
    self.public_key = Crypto::Key.new(self.private_key, self.password).public_key
  end

  def encrypt(data)
    public_key = Crypto::Key.new(self.public_key)
    public_key.encrypt(data)                                             
  end

  def decrypt(data)
    private_key = Crypto::Key.new(self.private_key, self.password)
    private_key.decrypt(data)
  end
end
