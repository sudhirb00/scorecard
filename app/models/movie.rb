class Movie < ActiveRecord::Base

  self.table_name = 'tc_movie_master'
  self.primary_key = "iMovieId"

end
