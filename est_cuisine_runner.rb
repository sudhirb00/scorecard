require 'awesome_print'
require 'time'

VERBOSE = 1
CURRENT_LEVEL = 3


def self.log_message(message, level=3)
  # level should be from 1 - 5, 5 being heighest
  current_time = Time.now.asctime

  if level <= CURRENT_LEVEL
    # Rails.logger.info( "#{current_time} : #{message}")
    puts ( "#{current_time} : #{message}")

  end 
  
  
end


log_message("Script Begin ...", 1)

@cuisine_data = {}
@cuisine_map = {}

log_message("Getting Cuisines",2)
Cuisine.all.each { |cuisine|
#  puts cuisine.to_yaml
  
 @cuisine_map[ "#{cuisine.cui_id}"]  = {:id => cuisine.cui_id, :name => cuisine.cuisines_name ,
              :description => cuisine.cuisines_desc } 
      }
# ap @cuisine_map

log_message("Getting establishments",2)

Establishment.all.each { |est|
  log_message(est.to_yaml, 5)
  Rails.logger.info("Processing : [#{est.est_id}] [#{est.est_name}]");
  log_message(est.est_cuisines, 4)
  @est_cuisines = est.est_cuisines.split(",")
  @est_cuisines.each { |est_cuisine|
    
    log_message("Est cuisine : #{est_cuisine}", 5)
    next if (est_cuisine.empty?)
    cuisine_id = @cuisine_map[est_cuisine][:id]
  if @cuisine_data["#{cuisine_id}"].nil?  
    @cuisine_data["#{cuisine_id}"] = { :cuisine_id => cuisine_id, :cuisine_name =>  @cuisine_map[est_cuisine][:name],
    :description =>  @cuisine_map[est_cuisine][:description] ,
      :establishments => [:id => est.est_id, :name => est.est_name, :cuisines => @est_cuisines]
      }
  else
    @cuisine_data["#{cuisine_id}"][:establishments] << {:id => est.est_id, :name => est.est_name, :cuisines => @est_cuisines}
   #exit
  end
  }
}

# ap @cuisine_data if VERBOSE

log_message("we have collected enough data, now let's summarize this",2)

@cuisine_data.each { |key, data|
  log_message("Processing for #{key}",4)
  est_with_this_cuisine = data[:establishments].length
  @cuisine_data[key][:est_count] = est_with_this_cuisine
   data[:establishments].each { | est|
    est[:cuisines].each { | cuisine|
      if @cuisine_data[key][:cuisine_group].nil?
        @cuisine_data[key][:cuisine_group] = { cuisine => 1 }
      elsif @cuisine_data[key][:cuisine_group][cuisine].nil?
        @cuisine_data[key][:cuisine_group][cuisine] = 1 
      else
        this_cuisine = @cuisine_data[key][:cuisine_group][cuisine]
        this_cuisine = this_cuisine + 1
        @cuisine_data[key][:cuisine_group][cuisine] = this_cuisine
      end
      } 
   }
  
}

#ap @cuisine_data

@final_cuisine_hash = {}

@cuisine_data.each { | key, data|


  otherCuisines = data[:cuisine_group]
  otherCuisinesNames = {}
  otherCuisines.each { | key, value |
    log_message("key #{key} ", 5)
    next if (key.empty?)
    otherCuisinesNames[@cuisine_map[key][:id]] = value
      }
  
  
  @final_cuisine_hash["#{data[:cuisine_id]}"] = { :EstablishmentCount => data[:est_count], 
    :OtherCuisines => otherCuisinesNames }
  
}

#ap @final_cuisine_hash

log_message("Created the data. Now writing it to cuisines_data.yml",1)
File.open("cuisines_data.yml", "w") {|f| f.write(@cuisine_data.to_yaml) }

log_message("Saving Summary data to cuisines_summary_data.yml",1)
File.open("cuisines_summary_data.yml", "w") {|f| f.write(@final_cuisine_hash.to_yaml) }

log_message("Written file",1)

log_message("Script Finish ...", 1)

# end of main
# 9350010776
