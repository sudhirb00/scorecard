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

@establishment_data   = {}
@log_access_est_hash  = {}
log_message("Getting establishment",2)
puts "start LogAccess"

#get the Establishments in log_acess 
@log_access_est =LogAccess.select("entity_id,entity_type,count(entity_id) as count_entity_id").where(:entity_type => "est").group(:entity_id).order("count_entity_id desc").limit(100)
#puts @log_access_est.inspect
virtual_no = ''
is_paid    = ''
@log_access_est.each { |establishment|
  #-start--------------get the establishment details by est_id----------------
   if(establishment.entity_id)
      @est_details = Establishment.select("est_id,est_name,est_guid,est_phone_alias").where(:est_id=>establishment.entity_id)
      #puts @est_details.inspect
      #puts @est_details[0].est_id
      if(@est_details.count>0)
          est_name        = @est_details[0].est_name
          est_guid        = @est_details[0].est_guid
          est_phone_alias = @est_details[0].est_phone_alias

          if (est_phone_alias && est_phone_alias!="9999999999")
           # puts 'valid virtual_no'
            virtual_no = est_phone_alias
          else
            #puts 'not valid virtual_no'
            virtual_no = 0
          end 
      end
      #puts virtual_no 
   end
  #-end--------------get the establishment details by est_id----------------


  #-start------------get the sponsor details by est_id--------------
   if(establishment.entity_id)
      @sponsor = Sponsor.select("sponsor_id,est_id").where(:est_id=>establishment.entity_id)
      #puts @sponsor.inspect
      #puts @sponsor.count
      if(@sponsor.count>0)
        sponsor_id= @sponsor[0].sponsor_id
        if(sponsor_id)
          is_paid = 1
        else
          is_paid = 0
        end
      else
        is_paid = 0
      end
   end
  #-end------------get the sponsor details by est_id-------------- 
   puts "entity_id:#{establishment.entity_id}-entity_name:#{est_name}-est_guid:#{est_guid}-entity_type:#{establishment.entity_type}-count_entity_id:#{establishment.count_entity_id}-virtual_no:#{virtual_no}-is_paid:#{is_paid}"
   @log_access_est_hash[ "#{establishment.entity_id}"]  = {
                                                            :entity_id => establishment.entity_id,
                                                            :entity_name => est_name,
                                                            :est_guid => est_guid,
                                                            :entity_type => establishment.entity_type,
                                                            :count_entity_id => establishment.count_entity_id,
                                                            :virtual_no => virtual_no,
                                                            :is_paid => is_paid
                                                          } 
}

# ap @establishment_map
puts @log_access_est_hash.inspect
puts "end LogAccess"

#-start------write file log_access_est_hash---------------------------------
log_message("Created the data. Now writing it to log_access_est.yml",1)
File.open("log_access_est.yml", "w") {|f| f.write(@log_access_est_hash.to_yaml) }
log_message("Written file",1)
log_message("Script Finish ...", 1)
#-end------write file log_access_est_hash---------------------------------



