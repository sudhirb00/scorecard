class ReviewRating < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_reviews_rating'
  self.primary_key = "rev_id"
  self.inheritance_column = nil
  default_scope :conditions =>  [ "rev_user_id != 0  and insertdate between '2010-01-01' and '2099-01-01' "]
  scope :created_on_date, lambda { |time|  {:conditions => ["date_format(insertdate, '%Y/%m/%d') = ?", time] } }

   

  def self.monthly_data_by_type(no_seeders = false)
  
  logger.debug("No seeders")
  logger.debug(no_seeders)
  if no_seeders.to_i == 1
      sorted_reviews = select("rev_id, type, insertdate", ).no_seeders
  else
    sorted_reviews = select("rev_id, type, insertdate", )
  end
    
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


  def self.daily_data_by_type (month_to_query, no_seeders = false)

  if no_seeders.to_i == 1
  sorted_reviews = select("rev_id, type, insertdate", ).where("date_format(insertdate, '%Y/%m') = ? " , month_to_query ).no_seeders
  else
  sorted_reviews = select("rev_id, type, insertdate", ).where("date_format(insertdate, '%Y/%m') = ? " , month_to_query )
  end
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

  scope :no_seeders, :conditions => ["rev_user_id not in (
                            42332,
                            42333,
                            42103,
                            42060,
                            43935,
                            42063,
                            42247,
                            42248,
                            42330,
                            43934,
                            42331,
                            42100,
                            43246,
                            42258,
                            42338,
                            43912,
                            42061,
                            43235,
                            43913,
                            43582,
                            42251,
                            42334,
                            43234,
                            42257,
                            43906,
                            42337,
                            42348,
                            43123,
                            43932,
                            43071,
                            42284,
                            42342,
                            42098,
                            43910,
                            43792,
                            42252,
                            42336,
                            42102,
                            42347,
                            43933,
                            43209,
                            43210,
                            43791,
                            42374,
                            44011,
                            43153,
                            42340,
                            42096,
                            45471,
                            45476,
                            45477,
                            45481,
                            45483,
                            45493,
                            45490,
                            45493,
                            45495,
                            45497,
                            45499,
                            45711,
                            45589,
                            45590,
                            45592,
                            45594,
                            45599,
                            45595,
                            45596,
                            45597,
                            45598,
                            41847,
                            41848,
                            41851,
                            41853,
                            41854,
                            42118,
                            42120,
                            42254,
                            42259,
                            42267,
                            42262,
                            42265,
                            42279,
                            42335,
                            42399,
                            42339,
                            42341,
                            42343,
                            42345,
                            42346,
                            42350,
                            42369,
                            42370,
                            42371,
                            42378,
                            42385,
                            42387,
                            42059,
                            42249,
                            42250,
                            42405,
                            43121,
                            43125,
                            43130,
                            43151,
                            43157,
                            43212,
                            43213,
                            43214,
                            44222,
                            44223,
                            44224,
                            44284,
                            44285,
                            45467,
                            45515,
                            45468,
                            45517,
                            45469,
                            45609,
                            45470,
                            45474,
                            45480,
                            45475,
                            45478,
                            45484,
                            45513,
                            45610,
                            45611,
                            45612,
                            45615,
                            45616,
                            45617,
                            45618 )"] 
end
