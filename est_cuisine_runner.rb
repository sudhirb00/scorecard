require 'awesome_print'
VERBOSE = 0


@cuisine_data = {}
@cuisine_map = {}

Cuisine.all.each { |cuisine|
  puts cuisine.to_yaml
  
 @cuisine_map[ "#{cuisine.cui_id}"]  = {:id => cuisine.cui_id, :name => cuisine.cuisines_name ,
              :description => cuisine.cuisines_desc } 
      }
ap @cuisine_map

#exit

Establishment.all.each { |est|
  puts est.est_cuisines if VERBOSE
  @est_cuisines = est.est_cuisines.split(",")
  @est_cuisines.each { |est_cuisine|
    puts est_cuisine.class
    cuisine_name = @cuisine_map[est_cuisine]
  if @cuisine_data[cuisine_name].nil?  
    @cuisine_data[cuisine_name] = [:id => est.est_id, :name => est.est_name, :cuisines => @est_cuisines]
  else
    l =  @cuisine_data[cuisine_name].length
    puts l
   @cuisine_data[cuisine_name] << {:id => est.est_id, :name => est.est_name, :cuisines => @est_cuisines}
  end
  }
}

ap @cuisine_data
