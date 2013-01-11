class User < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'tc_users'
  self.primary_key = "user_id"
  default_scope :conditions => {:created_date => '2010-01-01'..'2099-01-01'}
  scope :created_in_month, lambda {|month| {:conditions => ["date_format(created_date, '%Y/%m') = ?", month] }}
  
 
  def self.data_by_activation (query_month = nil)
  
    if query_month.nil?
      sorted_data = select("user_id, user_is_activated, created_date" )
    else
      sorted_data = select("user_id, user_is_activated, created_date" ).created_in_month(query_month)
    end    
    data_type_names = { 0 => "Not Activated", 1 => "Activated", 2 => "Deleted" }

    total_data = {}
    sorted_data.each do | s_data |
      # logger.debug(s_data)
      date = Date.parse(s_data.created_date.to_s)
      if query_month.nil?
        period = date.strftime("%Y/%m")
      else
        period = date.strftime("%Y/%m/%d")
      end  
      # logger.debug(month)
    total_data[period] ||= {}
    total_data[period]["#{data_type_names[s_data.user_is_activated]}"] ||= {}
    total_data[period]["#{data_type_names[s_data.user_is_activated]}"][:total] ||= 0
    total_data[period]["#{data_type_names[s_data.user_is_activated]}"][:total] += 1
     
    end

    total_data = total_data.sort_by { |k,v| k }
    total_data
     
  end

  def self.data_by_user_type(query_month = nil)

    if query_month.nil?
      sorted_data = select("user_id, user_type, created_date", )
    else
      sorted_data = select("user_id, user_type, created_date", ).created_in_month(query_month)
    end
    total_data = {}
    sorted_data.each do | s_data |
      # logger.debug(s_data)
      date = Date.parse(s_data.created_date.to_s)
      
      if query_month.nil?
        period = date.strftime("%Y/%m")
      else
        period = date.strftime("%Y/%m/%d")
      end  
      # logger.debug(month)
    total_data[period] ||= {}
    total_data[period]["#{s_data.user_type}"]||= {}
    total_data[period]["#{s_data.user_type}"][:total] ||= 0
    total_data[period]["#{s_data.user_type}"][:total] += 1
     
    end

    total_data = total_data.sort_by { |k,v| k }
    total_data
     
  end

  
end
