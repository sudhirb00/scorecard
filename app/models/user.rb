class User < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_users'
  self.primary_key = "user_id"

end
