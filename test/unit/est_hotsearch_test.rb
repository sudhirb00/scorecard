require 'test_helper'
require 'awesome_print'

class EstHotsearchTest < ActiveSupport::TestCase
   test "the truth" do

@data = EstHotsearch.find_by_sql ( "SELECT COUNT(*) AS count_all, date_format(insertdate, '%M-%Y'), est_city_id AS date_format_insertdate_m_y_est_city_id FROM `est_hotsearch` WHERE (`est_hotsearch`.`insertdate` BETWEEN '2012-01-01' AND '2099-01-01') GROUP BY date_format(insertdate, '%M-%Y'), est_city_id ")

ap @data
ap [1,2,3]

#@data.each { |data_row|
#	   print data_row.inspect + "\n"
#}
	puts "Hello"
   assert true

   end

end
