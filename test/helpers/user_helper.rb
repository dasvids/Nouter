module UserHelper

  def correct_password
    'StrongPasswordWithExtra12@'
  end

  def correct_password_digest
    BCrypt::Password.create correct_password
  end

  def wrong_email
    'any@example.com'
  end

  def wrong_password
    'no_password'
  end
end