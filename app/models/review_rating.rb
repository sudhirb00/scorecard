class ReviewRating < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_reviews_rating'
  self.primary_key = "rev_id"
  self.inheritance_column = nil


end
