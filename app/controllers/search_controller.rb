class SearchController < ApplicationController
  def index
      @cities = TcCity.all
      
  end
end
