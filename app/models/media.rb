class Media < ActiveRecord::Base

  self.table_name = 'tc_est_media'
  self.primary_key = "est_media_id"
  belongs_to :establishment
  default_scope :conditions => { :status => 1}
  

end
