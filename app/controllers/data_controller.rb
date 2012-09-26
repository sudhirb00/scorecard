class DataController < ApplicationController
  add_breadcrumb "Home", :root_path
  
  before_filter :authenticate, :except => ["other_cuisine_data", "listings_by_cuisine"]
  
        @@cuisine_data_hash = begin
          YAML.load(File.open("cuisines_data.yml"))
        rescue ArgumentError => e
          puts "Could not parse YAML: #{e.message}"
        end

  @@MINER_HASH = {
  :critic_reviews => {
        :condition_with_data =>  "est_editor_review != ''",
        :condition_without_data => "est_editor_review = '' or est_editor_review is NULL" ,
        :bread_crumb => ["Critic Reviews", "/data/critic_reviews"],
        :bread_crumb_city => ["By City", "/data/data_by_city"],
        :data_name => "Critic Reviews",
        :deep_link => '/data/data_by_city'
      },

      :gps_data => {
            :condition_with_data =>  "est_gps_cood != ''",
            :condition_without_data => "est_gps_cood = '' or est_gps_cood is NULL" ,
            :bread_crumb => ["GPS Data", "/data/gps_data"],
            :bread_crumb_city => ["By City", "/data/data_by_city"],
            :data_name => "GPS Data",
            :deep_link => '/data/data_by_city'
          },

      :phones_data => {
            :condition_with_data =>  "est_phone != ''",
            :condition_without_data => "est_phone = '' or est_phone is NULL" ,
            :bread_crumb => ["Phone Data", "/data/phone_data"],
            :bread_crumb_city => ["By City", "/data/data_by_city"],
            :data_name => "Phone Data",
            :deep_link => '/data/data_by_city'
          },
      
      :price_data => {
            :condition_with_data =>  "est_two_price != ''",
            :condition_without_data => "est_two_price = '' or est_two_price is NULL" ,
            :bread_crumb => ["Price Data", "/data/price_data"],
            :bread_crumb_city => ["By City", "/data/data_by_city"],
            :data_name => "Price Data",
            :deep_link => '/data/data_by_city'
          },
      :services_data => {
            :condition_with_data =>  "est_services_id != ''",
            :condition_without_data => "est_services_id = '' or est_services_id is NULL" ,
            :bread_crumb => ["Services Data", "/data/services_data"],
            :bread_crumb_city => ["By City", "/data/data_by_city"],
            :data_name => "Services Data",
            :deep_link => '/data/data_by_city'
          },
      :features_data => {
            :condition_with_data =>  "est_features_id != ''",
            :condition_without_data => "est_features_id = '' or est_features_id is NULL" ,
            :bread_crumb => ["Features Data", "/data/features_data"],
            :bread_crumb_city => ["By City", "/data/data_by_city"],
            :data_name => "Features Data",
            :deep_link => '/data/data_by_city'
          },
      :cuisines_data => {
            :condition_with_data =>  "est_cuisines != ''",
            :condition_without_data => "est_cuisines = '' or est_cuisines is NULL" ,
            :bread_crumb => ["Features Data", "/data/cuisines_data"],
            :bread_crumb_city => ["By City", "/data/data_by_city"],
            :data_name => "Cuisines Data",
            :deep_link => '/data/data_by_city'
          },


  }

  def get_data (action)
    return @@MINER_HASH[action.to_sym]
  end

  def show (data)
      data_hash = get_data(data[:action])
      add_breadcrumb data_hash[:bread_crumb][0], data_hash[:bread_crumb][1]
      @est_with_data = Establishment.count(:conditions => data_hash[:condition_with_data])
      @est_without_data = Establishment.count(:conditions => data_hash[:condition_without_data])
      @est_data = {"Not Having #{data_hash[:data_name]}" => @est_without_data,
                        "Having #{data_hash[:data_name]}" => @est_with_data}
                   
      @str_xml = DataController.generate_xml( "#{data_hash[:deep_link]}?data=#{data[:action]}&data_type=",
                                                      "#{data_hash[:data_name]} : ",
                                                      {:xmlData => @est_data,
                                                       :chartConfigs => {:caption => "Establishments",
                                                                         :subCaption => "Having / Not Having #{data_hash[:data_name]}",
                                                                         :pieRadius => 200
                                                       }
                                                      }
      )
      render :template => "establishment/establishments_data_compare" ,:locals =>
        { :deep_link => "#{data_hash[:deep_link]}?data=#{data[:action]}&data_type="  ,
        }


  end


  def critic_reviews

    show(:action => params[:action])

  end

  def gps_data

    show(:action => params[:action])

  end

  def phones_data

    show(:action => params[:action])

  end

  def price_data

    show(:action => params[:action])

  end

  def services_data

    show(:action => params[:action])

  end

  def features_data

    show(:action => params[:action])

  end

  def cuisines_data

    show(:action => params[:action])

  end


  def data_by_city
    data_hash = get_data(params[:data])
    add_breadcrumb data_hash[:bread_crumb][0], data_hash[:bread_crumb][1]
    add_breadcrumb data_hash[:bread_crumb_city][0], data_hash[:bread_crumb_city][1]

    @est_with_data = Establishment.group(:est_city_name).count(:conditions => data_hash[:condition_with_data])
    @est_with_data = @est_with_data.sort_by { |k,v| v }.reverse
    @est_without_data = Establishment.group(:est_city_name).count(:conditions => data_hash[:condition_without_data])
    @est_without_data = @est_without_data.sort_by { |k,v| v }.reverse
    @str_xml1 = EstablishmentController.generate_xml(
                                                    "/data/data_by_locality?data_exists=y&data=#{params[:data]}&city_name=",
                                                     "Establishments ",

                                                  {:xmlData => @est_with_data,
                                                   :chartConfigs => {:caption => "Establishments",
                                                                     :subCaption => "With #{data_hash[:data_name]}",
                                                                     :pieRadius => 100
                                                                    }
                                                  }
                                        )

    @str_xml2 = EstablishmentController.generate_xml(
                                                  "/data/data_by_locality?data_exists=n&data=#{params[:data]}&city_name=",
                                                       "Establishments ",
                                                     {:xmlData => @est_without_data,
                                                      :chartConfigs => {:caption => "Establishments",
                                                                        :subCaption => "Without #{data_hash[:data_name]}",
                                                                        :pieRadius => 100
                                                      }
                                                     }
                                              )
    render :template => "data/graph_data_by_city"  ,:locals =>
      { :deep_link =>       "/data/data_by_locality?data=#{params[:data]}&city_name=",
        :data_name => data_hash[:data_name]
      }
  
  end

  def data_by_locality
    data_hash = get_data(params[:data])
    add_breadcrumb data_hash[:bread_crumb][0], data_hash[:bread_crumb][1]
    add_breadcrumb data_hash[:bread_crumb_city][0], "/data/data_by_city?data=#{params[:data]}" 

    add_breadcrumb "By Locality", "/data/data_by_locality"

    @est_with_data = Establishment.group(:est_loc_name).count(:conditions => 
          "(#{data_hash[:condition_with_data]}) and est_city_name = '#{params[:city_name]}' " )
    @est_with_data = @est_with_data.sort_by { |k,v| v }.reverse

    top_rows = params[:top_rows].nil? ? 20 : params[:top_rows]
    params[:top_rows]=top_rows
    # select only top 20 for now.
    @est_with_data = @est_with_data[0..top_rows.to_i]

    @est_without_data = Establishment.group(:est_loc_name).count(:conditions => 
            "(#{data_hash[:condition_without_data]}) and est_city_name = '#{params[:city_name]}' " )
    @est_without_data = @est_without_data.sort_by { |k,v| v }.reverse
    @est_without_data = @est_without_data[0..top_rows.to_i]
    @str_xml1 = EstablishmentController.generate_xml(
                      "/data/est_short_details?data_exists=y&data=#{params[:data]}&est_city_name=#{params[:city_name]}&est_locality=",
                                                     "Establishments ",

                                                  {:xmlData => @est_with_data,
                                                   :chartConfigs => {:caption => "Establishments in #{params[:city_name]}",
                                                                     :subCaption => "With #{data_hash[:data_name]} - Showing Top #{top_rows}",
                                                                     :pieRadius => 100
                                                                    }
                                                  }
                                        )

    @str_xml2 = EstablishmentController.generate_xml(
                          "/data/est_short_details?data_exists=n&data=#{params[:data]}&est_city_name=#{params[:city_name]}&est_locality=",
                                                       "Establishments ",
                                                     {:xmlData => @est_without_data,
                                                      :chartConfigs => {:caption => "Establishments in #{params[:city_name]}",
                                                                        :subCaption => "Without #{data_hash[:data_name]} - Showing Top #{top_rows}",
                                                                        :pieRadius => 100
                                                      }
                                                     }
                                              )
      render :template => "data/graph_data_by_city" , :locals => {
          :deep_link_yes => 
              "/data/est_short_details?data_exists=y&data=#{params[:data]}&est_city_name=#{params[:est_city]}&est_locality=",
          :deep_link_no => 
              "/data/est_short_details?data_exists=n&data=#{params[:data]}&est_city_name=#{params[:est_city]}&est_locality=",
                  :page_header => "Establishment Type: #{params[:est_type]} City: #{params[:est_city]}",
                  :data_name => data_hash[:data_name]
            }

    end

    def est_short_details
    
    data_hash = get_data(params[:data])
    condition = params[:data_exists] == 'y' ? data_hash[:condition_with_data] : data_hash[:condition_without_data]
    @est_data = Establishment.all( :conditions =>
                  "est_city_name = '#{params[:est_city_name]}'
                  and est_loc_name = '#{params[:est_locality]}'
                  and status = 1
                  and ( #{condition} )
                  ")
    render :template => "establishment/est_short_details", :locals => {
        :page_header =>
            "Establishments in #{params[:est_locality]}, #{params[:est_city_name]}"
             }
    
    end
    
    def cuisines_relation

      cuisine_data_hash = begin
        YAML.load(File.open("cuisines_summary_data.yml"))
      rescue ArgumentError => e
        puts "Could not parse YAML: #{e.message}"
      end

      # top_rows = params[:top_rows].nil? ? 20 : params[:top_rows]
      # cuisine_data = cuisine_data[0..top_rows.to_i]
    
      @data_for_xml = {}
      cuisine_data_hash.each { |k,v |
        logger.debug( "k: #{k} , v: #{v}" )
        cuisine_master = Cuisine.first(:conditions => {:cui_id => k })
        logger.debug(cuisine_master.to_yaml)
        @data_for_xml [ cuisine_master.cuisines_name ] = {:key => cuisine_master.cui_id,
          :value => v[:EstablishmentCount] ,
          :hover_text => "#{cuisine_master.cuisines_name} #{cuisine_master.cuisines_desc}",
          :link => %{javascript:updateXML("#{k}");},
          # :id => reviewed_user.user_id
        }
      }
      @data_for_xml = @data_for_xml.sort_by { |k,v| k }

      
      @str_xml = ApplicationController.generate_xml_v2(
          {:xmlData =>  @data_for_xml,
           :chartConfigs => { :caption => "Establishment Cuisines",
                              :subCaption => "Number of Establishments for Cuisines",
                              :pieRadius => 100,
                              :xAxisName => "Cuisines",
                              :yAxisName => "Number of Establishments"
                   }
          }
   )
   # @str_xml2 = other_cuisine_data[ cuisine_data[0] ]
   render :template => "data/multiple",
   :locals =>
     { :deep_link =>       "http://timescity.com/profile/",
     }
    end
    
    def other_cuisine_data (cuisine_id = nil)
      
       params[:cuisine] = cuisine_id if (! cuisine_id.nil?)
        
      cuisine_data_hash = begin
        YAML.load(File.open("cuisines_summary_data.yml"))
      rescue ArgumentError => e
        puts "Could not parse YAML: #{e.message}"
      end

      cuisine_master_prev = Cuisine.first(:conditions => {:cui_id => params[:cuisine] })

      #logger.debug(cuisine_data_hash[params[:cuisine]])
      # top_rows = params[:top_rows].nil? ? 20 : params[:top_rows]
      # cuisine_data = cuisine_data[0..top_rows.to_i]
    
      
      cuisine_data = cuisine_data_hash[params[:cuisine]][:OtherCuisines]

      @data_for_xml = {}
      cuisine_data.each { |k,v |
        logger.debug( "k: #{k} , v: #{v}" )
        # skip this cuisine
        next if (k == params[:cuisine].to_i)
        cuisine_master = Cuisine.first(:conditions => {:cui_id => k })
        @data_for_xml [ cuisine_master.cuisines_name ] = {:key => cuisine_master.cuisines_name,
          :value => v ,
          :hover_text => "#{cuisine_master.cuisines_name} #{cuisine_master.cuisines_desc}",
    	    :link => "/data/listings_by_cuisine?primary_cuisine=#{params[:cuisine]}&secondary_cuisine=#{cuisine_master.cui_id}",
          # :id => reviewed_user.user_id
        }
      }

      @data_for_xml = @data_for_xml.sort_by { |k,v| k }
      
      @str_xml = ApplicationController.generate_xml_v2(
          {:xmlData =>  @data_for_xml,
           :chartConfigs => { :caption => "Establishment Serving Other cuisines",
                              :subCaption => "Which serve #{cuisine_master_prev.cuisines_name}",
                              :pieRadius => 100,
                              :xAxisName => "Cuisines",
                              :yAxisName => "Number of Establishments"
                    }
          }
   )
      
      
      render :text => @str_xml
    end  
    
    def listings_by_cuisine
      # render :text => "pc : #{params[:primary_cuisine]}  sc #{params[:secondary_cuisine]}"

      add_breadcrumb "Cuisine Relations", "/data/cuisines_relation"

      pc_cuisine_master = Cuisine.first(:conditions => {:cui_id => params[:primary_cuisine]})
      sc_cuisine_master = Cuisine.first(:conditions => {:cui_id => params[:secondary_cuisine] })
      
      this_cuisine_data = @@cuisine_data_hash[params[:primary_cuisine]]
      logger.debug(this_cuisine_data)
      est_str = []
      this_cuisine_data[:establishments].each { |est|
         logger.debug(est[:cuisines])
          est_str << est[:id] if est[:cuisines].include?(params[:secondary_cuisine])
        }
    # render :text => str    
    logger.debug(est_str)
    @est_data = Establishment.all( :conditions =>
                                       "est_id in  (#{est_str.join(",")})" )

    render :template => "establishment/est_short_details", :locals => {
        :page_header =>
            "Establishments Listings for the cuisines serving #{pc_cuisine_master.cuisines_name} & #{sc_cuisine_master.cuisines_name}"
          }

    end
    
end
