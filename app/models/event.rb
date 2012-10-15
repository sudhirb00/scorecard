class Event < ActiveRecord::Base
  self.table_name = 'tc_deal_events'
  self.primary_key = "dde_id"
  default_scope :conditions => {:insert_date => '2012-01-01'..'2099-01-01'}

end
