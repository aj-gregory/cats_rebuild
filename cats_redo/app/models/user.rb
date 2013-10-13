class User < ActiveRecord::Base
  attr_accessible :password_digest, :username

  validates :password_digest, :username, :presence => true

  has_many :cats,
    :dependent => :destroy

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil if user.nil?

    user.password_digest == password ? user : nil
  end



end
