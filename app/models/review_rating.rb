class ReviewRating < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_reviews_rating'
  self.primary_key = "rev_id"
  self.inheritance_column = nil
  default_scope :conditions => [ "rev_user_id != 0" ]


end
