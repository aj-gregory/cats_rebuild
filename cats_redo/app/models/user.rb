class User < ActiveRecord::Base
  attr_accessible :password_digest, :username

  has_may :cats
    :dependent => :destroy

 #  has_may :cat_rental_requests
end
