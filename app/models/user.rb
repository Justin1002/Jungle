class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  has_secure_password
  validates :password, length: {minimum: 5}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence:true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true
end
