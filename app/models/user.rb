class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self)
  end
end
