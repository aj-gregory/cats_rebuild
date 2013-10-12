class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_date, :color, :name, :user_id, :sex

  validate :age, :birth_date, :color, :name, :sex, :presence => true

  belongs_to :owner,
    :class_name => "User",
    :foreign_key => :user_id

  has_many :rental_requests,
    :class_name => "CatRentalRequest",
    :dependent => :destroy
end
