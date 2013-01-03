class User < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_users'
  self.primary_key = "user_id"
  default_scope :conditions => {:created_date => '2011-01-01'..'2099-01-01'}
  
 
  def self.monthly_data_by_type
    sorted_logins = select("rev_id, type, insertdate", )

    review_type_names = { 1 => "Establishments", 2 => "Movies" }

    total_data = {}
    sorted_reviews.each do | s_review |
    # logger.debug(s_review)
      date = Date.parse(s_review.insertdate.to_s)
      month = date.strftime("%Y/%m")
      # logger.debug(month)
    total_data[month] ||= {}
    total_data[month]["#{review_type_names[s_review.type]}"] ||= {}
    total_data[month]["#{review_type_names[s_review.type]}"][:total] ||= 0
    total_data[month]["#{review_type_names[s_review.type]}"][:total] += 1
     
    end

    total_data = total_data.sort_by { |k,v| k }
    total_data
     
  end
  
end
