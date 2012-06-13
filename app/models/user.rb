class User < ActiveRecord::Base
  attr_accessible :confirmationPassword, :email, :isAdmin, :password, :token
  before_save :create_token
  has_many :posts

  def create_token
    self.token = SecureRandom.urlsafe_base64

  end

end
