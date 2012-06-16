# == Schema Information
#
# Table name: users
#
#  id                    :integer         not null, primary key
#  email                 :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  token                 :string(255)
#  isAdmin               :boolean
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible  :email, :password, :password_confirmation, :isAdmin, :token
  before_save :create_token
  has_many :posts

  before_save { |user| user.email = email.downcase }

  VALID_EMAIL_REGEXP = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  def create_token
    self.token = SecureRandom.urlsafe_base64

  end

end
