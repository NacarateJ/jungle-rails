class User < ApplicationRecord
  
  has_secure_password

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase) # Remove leading/trailing spaces and make email case-insensitive
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

end
