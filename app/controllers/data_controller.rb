class DataController < ApplicationController
  add_breadcrumb "Home", :root_path
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
      }
      


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
                   
      @str_xml = EstablishmentController.generate_xml( "#{data_hash[:deep_link]}?data=#{data[:action]}&data_type=",
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
                                                                     :pieRadius => 125
                                                                    }
                                                  }
                                        )

    @str_xml2 = EstablishmentController.generate_xml(
                                                  "/data/data_by_locality?data_exists=n&data=#{params[:data]}&city_name=",
                                                       "Establishments ",
                                                     {:xmlData => @est_without_data,
                                                      :chartConfigs => {:caption => "Establishments",
                                                                        :subCaption => "Without #{data_hash[:data_name]}",
                                                                        :pieRadius => 125
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
                                                                     :pieRadius => 125
                                                                    }
                                                  }
                                        )

    @str_xml2 = EstablishmentController.generate_xml(
                          "/data/est_short_details?data_exists=n&data=#{params[:data]}&est_city_name=#{params[:city_name]}&est_locality=",
                                                       "Establishments ",
                                                     {:xmlData => @est_without_data,
                                                      :chartConfigs => {:caption => "Establishments in #{params[:city_name]}",
                                                                        :subCaption => "Without #{data_hash[:data_name]} - Showing Top #{top_rows}",
                                                                        :pieRadius => 125
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
    

end
