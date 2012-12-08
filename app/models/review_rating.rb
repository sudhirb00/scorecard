class ReviewRating < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_reviews_rating'
  self.primary_key = "rev_id"
  self.inheritance_column = nil
  default_scope :conditions =>  [ "rev_user_id != 0  and insertdate between '2011-01-01' and '2099-01-01' "]


  def self.monthly_data_by_type
    sorted_reviews = select("rev_id, type, insertdate", )

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


  def self.daily_data_by_type (month_to_query)
    sorted_reviews = select("rev_id, type, insertdate", ).where("date_format(insertdate, '%Y/%m') = ? " , month_to_query )

    review_type_names = { 1 => "Establishments", 2 => "Movies" }

    total_data = {}
    sorted_reviews.each do | s_review |
    
    # logger.debug(s_review)
      date = Date.parse(s_review.insertdate.to_s)
      month = date.strftime("%Y/%m/%d")
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
