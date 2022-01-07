module UserHelper

  def correct_password
    'StrongPasswordWithExtra12@'
  end

  def correct_password_digest
    BCrypt::Password.create correct_password
  end

end