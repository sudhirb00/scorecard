class TcCity < ActiveRecord::Base
  self.table_name = 'tc_city'
  self.primary_key = "city_id"	
  has_many :HotSearches , :class_name => "EstHotsearch",
           :foreign_key => "est_city_id"
  default_scope :conditions => { :status => 1}

end
