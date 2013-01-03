class LogAccess < ActiveRecord::Base
  self.table_name = 'log_access'

  def self.monthly_data_by_entity_type
    sorted_data = select("id, entity_type, log_time", )

    total_data = {}
    sorted_data.each do | s_data |
    # logger.debug(s_review)
      date = Date.parse(s_data.log_time.to_s)
      month = date.strftime("%Y/%m")
      # logger.debug(month)
    total_data[month] ||= {}
    total_data[month]["#{s_data.entity_type}"] ||= {}
    total_data[month]["#{s_data.entity_type}"][:total] ||= 0
    total_data[month]["#{s_data.entity_type}"][:total] += 1
     
    end

    total_data = total_data.sort_by { |k,v| k }
    total_data
     
  end


end
