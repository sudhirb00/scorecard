class ReviewController < ApplicationController
  add_breadcrumb "Home", :root_path
  REALM = "Enter password for Timescity Scorecard"
  # this should be changed on production
  USERS = {
           "tcity" => Digest::MD5.hexdigest(["tcity",REALM,"xxxx"].join(":"))}  #ha1 digest password
  
  before_filter :authenticate, :except => [:index]

  def index

    add_breadcrumb "Monthly Reviews", "/review/index"
    @reviews_monthly_data = ReviewRating.group("date_format(insertdate, '%Y/%m')").count(:conditions => {:insertdate => '2011-01-01'..'2099-01-01'})

    @str_xml = EstablishmentController.generate_xml(
                                                    '/review/reviews_by_month?month=',
                                                    "Number of Reviews in ",
        {:xmlData =>  @reviews_monthly_data,
         :chartConfigs => { :caption => "Monthly Reviews Created",
                            :subCaption => "(For Each Month)",
                            :xAxisName => "Months",
                            :yAxisName => "Number of Reviews",
                            :skipNames => 3
         }
        }



    )

    # @str_xml = EstablishmentController.create_graph_xml( )

  end

  def reviews_by_month

    add_breadcrumb "Monthly Reviews", "/review/index"

    add_breadcrumb "Daily Reviews", "/review/reviews_by_month"

    @reviews_monthly_data = ReviewRating.group("date_format(insertdate, '%Y/%m/%d')").count(:conditions => "date_format(insertdate, '%Y/%m') = '#{params[:month]}'")
    @str_xml = EstablishmentController.generate_xml('/review/review_details?date=',
                                                    "Number of Reviews on ",

                                {:xmlData =>  @reviews_monthly_data,
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

    @reviews_daily_data = ReviewRating.find(:all, :conditions => "date_format(insertdate, '%Y/%m/%d') = '#{params[:date]}'")
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

end
