class Sponsor < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name  = 'tc_sponsor'
  self.primary_key = "sponsor_id"
  default_scope :conditions => { :status => 1}


end
