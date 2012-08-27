class EstablishmentController < ApplicationController
  add_breadcrumb "Home", :root_path


  def est_type

    add_breadcrumb "Establishments", "/establishment/est_type"

    @est_data = Establishment.group(:est_which_type).count(:conditions => "status = 1")

    @str_xml = EstablishmentController.generate_xml("Establishment Types",
                                                    '(Across all cities)',
                                                    '/establishment/est_type_by_city?est_type=',
                                                    "Establishment Type: ",
                                                    @est_data)


  end

  def est_type_by_city

    add_breadcrumb "Establishments", "/establishment/est_type"

    add_breadcrumb "Establishments by City", "/establishment/est_type_by_city"

    @est_data = Establishment.group(:est_city_name).count(
        :conditions => "status = 1 and est_which_type = '#{params[:est_type]}'")
    @est_data = @est_data.sort_by { |k,v| v }.reverse
    @str_xml = EstablishmentController.generate_xml(
        "Establishment Types - #{params[:est_type]}",
        '(By City)',
        "/establishment/est_type_city_locality?est_type=#{params[:est_type]}&est_city=",
        "Establishment Type: #{params[:est_type]} in ",
        @est_data)

  end

  def est_type_city_locality

    @est_data = Establishment.group(:est_loc_name).count(
        :conditions => "status = 1 and est_which_type = '#{params[:est_type]}'
                        and est_city_name = '#{params[:est_city]}'")
    @est_data = @est_data.sort_by { |k,v| v }.reverse

    # select only top 5 for now.
    @est_data = @est_data[1..20]

    @str_xml = EstablishmentController.generate_xml(
        "Establishment Types - #{params[:est_type]} - City : #{params[:est_city]}",
        '(Across all localities)',
        # 'test',
        "/establishment/est_locality_details?est_type=#{params[:est_type]}&est_city_name=#{params[:est_city]}&est_locality=",
        "Establishment Type: #{params[:est_type]} City: #{params[:est_city]} in Area ",
        @est_data)

  end

end

