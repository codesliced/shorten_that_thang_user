class User < ActiveRecord::Base
  include BCrypt

  has_many :urls

  def self.authenticate(credentials={})
    user = User.find_by_email(credentials[:email])
    return nil if user.nil?
    return user if user.match_password?(credentials[:password])
  end

  def password=(secret)
    @password = Password.create(secret)
    self.password_hash = @password
  end

  def password
    @password ||= Password.new(password_hash)
  end

  private

  def match_password?(secret)
    Password.new(self.password_hash) == secret
  end

end
