class Author < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_author_master'
  self.primary_key = "author_id"

end
