class User < ApplicationRecord
  has_secure_password

  def self.authenticate_success(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end
  end
end
