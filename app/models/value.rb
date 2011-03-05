class Value < ActiveRecord::Base
  belongs_to :user
  attr_accessor :data

  before_validation {self.encrypt!}

  def encrypt!
    self.encrypted_data = self.user.encrypt(self.data)
  end

  def decrypt!(u)
    self.data = u.decrypt(self.encrypted_data) if user == u && u.password
  end
end
