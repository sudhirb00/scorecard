class ReviewController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index

    add_breadcrumb "Monthly Reviews", "/review/index"
    @reviews_monthly_data = ReviewRating.group("date_format(insertdate, '%Y/%m')").count(:conditions => {:insertdate => '2011-01-01'..'2099-01-01'})

    @str_xml = EstablishmentController.generate_xml(
                                                    '/review/reviews_by_month?month=',
                                                    "Number of Reviews in ",
        {:xmlData =>  @reviews_monthly_data,
         :chartConfigs => {:caption => "Monthly Reviews Created",
                           :subCaption => "(For Each Month)",
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
                                      :yAxisName => "Number of Reviews"
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

end
