class ReviewController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_filter :authenticate

  def index

    add_breadcrumb "Monthly Reviews", "/review/index"

    @monthly_data = ReviewRating.monthly_data_by_type(cookies[:timescity_goggles])

    @data_for_xml = {}
    @monthly_data.each { |k,v |
      # logger.debug( "k: #{k} , v: #{v}" )
      # skip this cuisine
      @data_for_xml [ k ] = {:key => k,
        :value => v ,
        :hover_text => "k",
  	    :link => "/review/reviews_by_month?month=",
      }
    }

    @str_xml = ReviewController.generate_stacked_xml(
        {:xmlData =>  @data_for_xml,
         :chartConfigs => { 
                              :caption => "Reviews Data by Month",
                              :subCaption => "By Review Type",
                              :animation => 1,
                              :xAxisName => "Months",
                              :yAxisName => "Number of Reviews"
                            }
                  }
        )
 
  end

  def reviews_by_month

    add_breadcrumb "Monthly Reviews", "/review/index"
    @monthly_data = ReviewRating.daily_data_by_type(params[:month], cookies[:timescity_goggles])

    @data_for_xml = {}
    @monthly_data.each { |k,v |
      logger.debug( "k: #{k} , v: #{v}" )
      # skip this cuisine
      @data_for_xml [ k ] = {:key => k,
        :value => v ,
        :hover_text => "k",
  	    :link => "/review/review_details?date=",
      }
    }

    @str_xml = ReviewController.generate_stacked_xml(
        {:xmlData =>  @data_for_xml,
         :chartConfigs => { 
                              :caption => "Daily Reviews Data",
                              :subCaption => "By Review Type",
                              :animation => 1,
                              :xAxisName => "Days",
                              :yAxisName => "Number of Reviews"
                            }
                  }
        )
        render :template => "review/index"
 
  end
  



  def old_reviews_by_month

    add_breadcrumb "Monthly Reviews", "/review/index"

    add_breadcrumb "Daily Reviews", "/review/reviews_by_month"

    @monthly_data = ReviewRating.group("date_format(insertdate, '%Y/%m/%d')").count(:conditions => "date_format(insertdate, '%Y/%m') = '#{params[:month]}'")

    @str_xml = EstablishmentController.generate_xml('/review/review_details?date=',
                                                    "Number of Reviews on ",

                                {:xmlData =>  @monthly_data,
                                 :chartConfigs =>
                                     {
                                      :caption => "Daily Reviews created in the Month",
                                      :subCaption => "For the month of : #{params[:month]}",
                                      :xAxisName => "Date Range",
                                      :yAxisName => "Number of Reviews",
                                      :skipNames => 7
                                     }
                                }

    )
    render :template => "review/index"

  end

  def review_details

    add_breadcrumb "Monthly Reviews", "/review/index"

    add_breadcrumb "Daily Reviews", "/review/reviews_by_month?month=#{params[:date][0..6]}"

    add_breadcrumb "Reviews Data", "/review/review_details"

    if cookies[:timescity_goggles]
      @reviews_daily_data = ReviewRating.find(:all, :conditions => "date_format(insertdate, '%Y/%m/%d') = '#{params[:date]}'").no_seeders
    else
      @reviews_daily_data = ReviewRating.find(:all, :conditions => "date_format(insertdate, '%Y/%m/%d') = '#{params[:date]}'")
    end
    #render :text => @reviews_daily_data.to_yaml

  end


  def critic_reviews

    add_breadcrumb "Critic Reviews", "/review/critic_reviews"

    @est_with_data = Establishment.count(:conditions => "est_editor_review != ''")
    @est_without_data = Establishment.count(:conditions => "est_editor_review = '' or est_editor_review is NULL")
    @est_data = {"Having Critic Revies" => @est_with_data,
                 "Not Having Critic Reviews" => @est_without_data}
    @str_xml = EstablishmentController.generate_xml('/review/review_data_by_city?data_type=',
                                                    "Critic Reviews ",
                                                    {:xmlData => @est_data,
                                                     :chartConfigs => {:caption => "Establishments",
                                                                       :subCaption => "Having / Not Having Reviews",
                                                                       :pieRadius => 150
                                                     }
                                                    }
    )
    render :template => "establishment/est_type" ,:locals =>
        {:deep_link => '/review/review_data_by_city?data_type=',
                            }

  end

  def review_data_by_city

    add_breadcrumb "Review Data", "/review/critic_reviews"
    add_breadcrumb "GPS Data by City", "/review/review_data_by_city"

    @est_with_data = Establishment.group(:est_city_name).count(:conditions => "est_editor_review != ''")
    @est_with_data = @est_with_data.sort_by { |k,v| v }.reverse
    @est_without_data = Establishment.group(:est_city_name).count(:conditions => "est_editor_review = '' or est_editor_review is NULL")
    @est_without_data = @est_without_data.sort_by { |k,v| v }.reverse
    @str_xml1 = EstablishmentController.generate_xml(
        '#',# '/establishment/gps_by_city?gps_type=',
        "Establishments ",

        {:xmlData => @est_with_data,
         :chartConfigs => {:caption => "Establishments",
                           :subCaption => "With Critic Reviews",
                           :pieRadius => 100
         }
        }
    )

    @str_xml2 = EstablishmentController.generate_xml(
        '#', #/establishment/gps_by_city?gps_type=',
        "Establishments ",
        {:xmlData => @est_without_data,
         :chartConfigs => {:caption => "Establishments",
                           :subCaption => "Without Critic Reviews",
                           :pieRadius => 100
         }
        }
    )
    render :template => "establishment/graph_data_by_city"

  end


  def self.generate_stacked_xml (xml_config)
    
    @chart_config =  nil
    @chart_config =  DEFAULT_CHART_CONFIGS

    xml_config[:chartConfigs].each do |k, v|
      @chart_config[k] = v
    end

    
    xml = Builder::XmlMarkup.new()
    xml.graph(@chart_config) do

    xml.categories() do
      xml_config[:xmlData].each do  |xmlKey, xmlDataRow|

        xml.category(:name => xmlKey)
      end  
          
    end

    xml.dataset(:seriesName => "Establishments", :color => "008040" ) do
      xml_config[:xmlData].each do  |xmlKey, xmlDataRow|
      #logger.debug("Hi : ")
      #logger.debug( xmlDataRow)
      number = xmlDataRow[:value]["Establishments"].nil? ? 0 : xmlDataRow[:value]["Establishments"][:total]

        xml.set(:value => number,
                :link => "#{xmlDataRow[:link]}#{xmlDataRow[:key]}"
                )
      end  
          
    end

 
    xml.dataset(:seriesName => "Movies", :color => "FFFF00") do
      xml_config[:xmlData].each do  |xmlKey, xmlDataRow|
      
      number = xmlDataRow[:value]["Movies"].nil? ? 0 : xmlDataRow[:value]["Movies"][:total]
        xml.set(:value => number,
        :link => "#{xmlDataRow[:link]}#{xmlDataRow[:key]}"
        )
      end  
          
    end

      

    end

    ret_val = xml
    # ret_val = ret_val.gsub(/[']/, '\\\\\'')
    return ret_val
  end


end
