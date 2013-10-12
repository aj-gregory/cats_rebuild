class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :end_date, :start_date

  belongs_to :cat
end
