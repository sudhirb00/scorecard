class EstHotsearch < ActiveRecord::Base
  # attr_accessible :title, :body
  self.table_name = 'est_hotsearch'
  self.primary_key = "id"
  belongs_to :tc_city

  def self.search_raw_data
      @search_monthly_data = self.count(:group => 'date_format(insertdate, "%Y/%m")', :conditions => { :insertdate => '2010-01-01'..'2099-01-01' } )
  end


end
