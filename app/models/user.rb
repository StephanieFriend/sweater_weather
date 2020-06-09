class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, if: :password
  validates :password_confirmation, presence: true

  def error_message
    if password != password_confirmation
      'Passwords gotta match!'
    elsif User.find_by(email: email)
      'Someone is already using your email?'
    elsif email.empty? || password.empty?
      'Sorry man. Need that email and password'
    else
      'Oops, it broke.'
    end
  end
end
