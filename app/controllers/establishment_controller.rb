class EstablishmentController < ApplicationController
  add_breadcrumb "Home", :root_path

  def est_type

    add_breadcrumb "Establishments", "/establishment/est_type"

    @est_data = Establishment.group(:est_which_type).count(:conditions => "status = 1")

    @str_xml = EstablishmentController.generate_xml('/establishment/est_type_by_city?est_type=',
                                                    "Establishment Type: ",
                                                    {
                                                        :xmlData => @est_data,
                                                        :chartConfigs => {
                                                            :caption  => "Establishments Types",
                                                            :subCaption => "Across all Cities",
                                                            :pieRadius => 200  
                                                        }
                                                    }
                                                  )
    render :locals => {:deep_link => '/establishment/est_type_by_city?est_type=',
                          }
  end

  def est_type_by_city

    add_breadcrumb "Establishments", "/establishment/est_type"

    add_breadcrumb "Establishments by Type", "/establishment/est_type_by_city"

    @est_data = Establishment.group(:est_city_name).count(
        :conditions => "status = 1 and est_which_type = '#{params[:est_type]}'")
    @est_data = @est_data.sort_by { |k,v| v }.reverse
    @str_xml = EstablishmentController.generate_xml(
                "/establishment/est_type_city_locality?est_type=#{params[:est_type]}&est_city=",
                "Establishment Type: #{params[:est_type]} in ",
                {
                    :xmlData => @est_data,
                    :chartConfigs => {
                        :caption  => "Establishment Types - #{params[:est_type]}",
                        :subCaption => "By City",
                        :pieRadius => 200
                    }
                }
    )
    render :locals => {:deep_link =>    "/establishment/est_type_city_locality?est_type=#{params[:est_type]}&est_city=",
           :page_header =>  "Establishment Types - #{params[:est_type]}"
            }
  end

  def est_type_city_locality

    add_breadcrumb "Establishments", "/establishment/est_type"
    add_breadcrumb "Establishments by Type", "/establishment/est_type_by_city?est_type=#{params[:est_type]}"
    add_breadcrumb "Establishments by Locality", "/establishment/est_type_city_locality"


    @est_data = Establishment.group(:est_loc_name).count(
        :conditions => "status = 1 and est_which_type = '#{params[:est_type]}'
                        and est_city_name = '#{params[:est_city]}'")
    @est_data = @est_data.sort_by { |k,v| v }.reverse

    top_rows = params[:top_rows].nil? ? 20 : params[:top_rows]
    # select only top 5 for now.
    @est_data = @est_data[0..top_rows.to_i]

    @str_xml = EstablishmentController.generate_xml(
              "/establishment/est_short_details?est_type=#{params[:est_type]}&est_city_name=#{params[:est_city]}&est_locality=",
              "Establishment Type: #{params[:est_type]} City: #{params[:est_city]} in Area ",
              {
                  :xmlData => @est_data,
                  :chartConfigs => {
                      :caption  => "Establishment Types - #{params[:est_type]}",
                      :subCaption => "By Locality in #{params[:est_city]} - Showing Top #{top_rows}",
                      :pieRadius => 200  
                  }
              }

    )
    render :locals => {:deep_link =>             "/establishment/est_short_details?est_type=#{params[:est_type]}&est_city_name=#{params[:est_city]}&est_locality=",
                :page_header => "Establishment Type: #{params[:est_type]} City: #{params[:est_city]}"
          }
  end


  def est_short_details

    add_breadcrumb "Establishments", "/establishment/est_type"

    add_breadcrumb "Establishments by Type", "/establishment/est_type_by_city?est_type=#{params[:est_type]}"

    add_breadcrumb "Establishments by Locality",
                   "/establishment/est_type_city_locality?est_type=#{params[:est_type]}&est_city=#{params[:est_city_name]}"

    add_breadcrumb "Establishments Listing",
                   "/establishment/est_short_details"

    @est_data = Establishment.all( :conditions =>
                  "est_city_name = '#{params[:est_city_name]}'
                  and est_which_type = '#{params[:est_type]}'
                  and est_loc_name = '#{params[:est_locality]}'
                  and status = 1
                  ")
    render :template => "establishment/est_short_details", :locals => {
        :page_header =>
            "Establishments in #{params[:est_locality]}, #{params[:est_city_name]} Type #{params[:est_type]}"
             }

  end



  def brands

    add_breadcrumb "Establishments", "/establishment/brands"

    @est_data = Establishment.group(:est_name).count(:conditions => "status = 1")
    @est_data = @est_data.sort_by { |k,v| v }.reverse

    top_rows = params[:top_rows].nil? ? 20 : params[:top_rows]
    # select only top 5 for now.
    @est_data = @est_data[0..top_rows.to_i]

    @str_xml = EstablishmentController.generate_xml('/establishment/brands_listing?b_name=',
                                                    "Establishment Name: ",
                                                    {
                                                        :xmlData => @est_data,
                                                        :chartConfigs => {
                                                            :caption  => "Brand Establishments Count",
                                                            :subCaption => "Showing Top #{top_rows} Count"

                                                        }
                                                    }
    )
    @dive_link = '/establishment/brands_listing?b_name=';

#    @str_xml = @str_xml.gsub("'", "\\'");

  end


  def brands_listing

    add_breadcrumb "Establishments", "/establishment/brands"
    add_breadcrumb "Establishments Listing", "/establishment/brands_listing"

    @est_data = Establishment.all( :conditions =>
                                       "est_name = '#{params[:b_name].gsub(/[']/, '\\\\\'')}'
                  and status = 1
                  ")

    render :template => "establishment/est_short_details", :locals => {
        :page_header =>
            "Establishments for brand #{params[:b_name]}"
          }

  end

  def page_views

    add_breadcrumb "Page Views", "/establishment/page_views"

    @est_data = LogAccess.group("date_format(log_time, '%Y/%m/%d')").count

    @str_xml = EstablishmentController.generate_xml('/establishment/page_views_for_day?date=',
                                                    "Date : ",
                                                    {:xmlData => @est_data,
                                                     :chartConfigs => {:caption => "Number of Page Views",
                                                                       :subCaption => "For Establishments Daily",
                                                                       :pieRadius => 300
                                                     }
                                                    }
                                              )


  end

  def gps_data

    add_breadcrumb "GPS Data", "/establishment/gps_data"

    @est_with_data = Establishment.count(:conditions => "est_gps_cood != ''")
    @est_without_data = Establishment.count(:conditions => "est_gps_cood = ''")
    @est_data = {"Having GPS Data" => @est_with_data,
                 "Not Having GPS Data" => @est_without_data}
    @str_xml = EstablishmentController.generate_xml('/establishment/graph_data_by_city?gps_type=',
                                                    "Establishments ",
                                                    {:xmlData => @est_data,
                                                     :chartConfigs => {:caption => "Establishments",
                                                                       :subCaption => "GPS Coordinates Data",
                                                                       :pieRadius => 150
                                                     }
                                                    }
                                            )
    render :template => "establishment/est_type"

  end

  def graph_data_by_city

    add_breadcrumb "GPS Data", "/establishment/gps_data"
    add_breadcrumb "GPS Data by City", "/establishment/gps_by_city"

    @est_with_data = Establishment.group(:est_city_name).count(:conditions => "est_gps_cood != ''")
    @est_with_data = @est_with_data.sort_by { |k,v| v }.reverse
    @est_without_data = Establishment.group(:est_city_name).count(:conditions => "est_gps_cood = ''")
    @est_without_data = @est_without_data.sort_by { |k,v| v }.reverse
    @str_xml1 = EstablishmentController.generate_xml(
                                                    '#',# '/establishment/gps_by_city?gps_type=',
                                                     "Establishments ",

                                                  {:xmlData => @est_with_data,
                                                   :chartConfigs => {:caption => "Establishments",
                                                                     :subCaption => "With GPS Coordinates",
                                                                     :pieRadius => 100
                                                                    }
                                                  }
                                        )

    @str_xml2 = EstablishmentController.generate_xml(
                                                     '#', #/establishment/gps_by_city?gps_type=',
                                                     "Establishments ",
                                                     {:xmlData => @est_without_data,
                                                      :chartConfigs => {:caption => "Establishments",
                                                                        :subCaption => "Without GPS Coordinates",
                                                                        :pieRadius => 100
                                                      }
                                                     }
                                              )
    render :template => "establishment/graph_data_by_city"

  end
end

