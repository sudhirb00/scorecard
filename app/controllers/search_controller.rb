class SearchController < ApplicationController
  def index
      @cities = TcCity.all
      logger.info "Hello World"
      render :text => "Hello"
      # logger.debug @cities
      @cities.each { | city_arr |

        city_arr.city_name

          city_arr.HotSearches.sum(:viewcount,  :conditions => [ ' insertdate > ? ', '2012-01-01'] )

        }
  end
end
