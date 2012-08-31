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
                                                            :subCaption => "Across all Cities"

                                                        }
                                                    }
                                                  )

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
                        :subCaption => "By City"

                    }
                }
    )

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
    @est_data = @est_data[1..top_rows.to_i]

    @str_xml = EstablishmentController.generate_xml(
              "/establishment/est_locality_details?est_type=#{params[:est_type]}&est_city_name=#{params[:est_city]}&est_locality=",
              "Establishment Type: #{params[:est_type]} City: #{params[:est_city]} in Area ",
              {
                  :xmlData => @est_data,
                  :chartConfigs => {
                      :caption  => "Establishment Types - #{params[:est_type]}",
                      :subCaption => "By Locality in #{params[:est_city]} - Showing Top #{top_rows}"

                  }
              }

    )

  end


  def est_locality_details

    add_breadcrumb "Establishments", "/establishment/est_type"

    add_breadcrumb "Establishments by Type", "/establishment/est_type_by_city?est_type=#{params[:est_type]}"

    add_breadcrumb "Establishments by Locality",
                   "/establishment/est_type_city_locality?est_type=#{params[:est_type]}&est_city=#{params[:est_city_name]}"

    @est_data = Establishment.all( :conditions =>
                  "est_city_name = '#{params[:est_city_name]}'
                  and est_which_type = '#{params[:est_type]}'
                  and est_loc_name = '#{params[:est_locality]}'
                  and status = 1
                  ")

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

    @est_with_gps = Establishment.count(:conditions => "est_gps_cood != ''")
    @est_without_gps = Establishment.count(:conditions => "est_gps_cood = ''")
    @est_data = {"Having GPS Data" => @est_with_gps,
                 "Not Having GPS Data" => @est_without_gps}
    @str_xml = EstablishmentController.generate_xml('/establishment/gps_data_by_city?gps_type=',
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

  def gps_data_by_city

    add_breadcrumb "GPS Data", "/establishment/gps_data"
    add_breadcrumb "GPS Data by City", "/establishment/gps_by_city"

    @est_with_gps = Establishment.group(:est_city_name).count(:conditions => "est_gps_cood != ''")
    @est_with_gps = @est_with_gps.sort_by { |k,v| v }.reverse
    @est_without_gps = Establishment.group(:est_city_name).count(:conditions => "est_gps_cood = ''")
    @est_without_gps = @est_without_gps.sort_by { |k,v| v }.reverse
    @str_xml1 = EstablishmentController.generate_xml(
                                                    '#',# '/establishment/gps_by_city?gps_type=',
                                                     "Establishments ",

                                                  {:xmlData => @est_with_gps,
                                                   :chartConfigs => {:caption => "Establishments",
                                                                     :subCaption => "With GPS Coordinates",
                                                                     :pieRadius => 100
                                                                    }
                                                  }
                                        )

    @str_xml2 = EstablishmentController.generate_xml(
                                                     '#', #/establishment/gps_by_city?gps_type=',
                                                     "Establishments ",
                                                     {:xmlData => @est_without_gps,
                                                      :chartConfigs => {:caption => "Establishments",
                                                                        :subCaption => "Without GPS Coordinates",
                                                                        :pieRadius => 100
                                                      }
                                                     }
                                              )
    render :template => "establishment/gps_data_by_city"

  end
end

