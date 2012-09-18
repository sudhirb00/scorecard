class Cuisine < ActiveRecord::Base
  self.table_name = 'tc_est_cuisines'
  self.primary_key = "cui_id"

end
