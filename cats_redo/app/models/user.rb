class User < ActiveRecord::Base
  attr_accessible :password_digest, :username, :session_token

  before_validation(:on => :create) do
    reset_session_token! if session_token.nil?
  end

  validates :password_digest, :username,:session_token, :presence => true

  has_many :cats,
    :dependent => :destroy

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?

    user.password_digest == password ? user : nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end


end
