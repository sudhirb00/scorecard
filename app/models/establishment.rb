class Establishment < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_establishments'
  self.primary_key = "est_id"


end
