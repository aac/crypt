class Value < ActiveRecord::Base
  belongs_to :user
  attr_accessor :data

  before_validation {self.encrypt!}

  def encrypt!
    self.user.encrypt(self.data)
  end
end
