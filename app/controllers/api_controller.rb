class ApiController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_filter :authenticate
	
  def monthly_hits
  add_breadcrumb "Api Monthly Hits", "/api/monthly_hits"
    @monthly_data = ApiLogAccess.group("date_format(log_time, '%Y/%m')").count(:conditions => {:log_time => '2011-01-01'..'2099-01-01'})
    @str_xml = EstablishmentController.generate_xml(
                                                    '/api/hits_by_month?month=',
                                                    "Number of Hits in ",
        {:xmlData =>  @monthly_data,
         :chartConfigs => { :caption => "Monthly API Hits",
                            :subCaption => "(For Each Month)",
                            :xAxisName => "Months",
                            :yAxisName => "Number of Hits",
                            :skipNames => 1
         }
        }
      )

      render :template => "review/index"

  end

  def hits_by_month

    add_breadcrumb "Api Monthly Hits", "/api/monthly_hits"

    add_breadcrumb "Daily Hits", "/api/hits_by_month"

    @monthly_data = ApiLogAccess.group("date_format(log_time, '%Y/%m/%d')").count(:conditions => "date_format(log_time, '%Y/%m') = '#{params[:month]}'")
    @str_xml = EstablishmentController.generate_xml('/api/api_hits_details?date=',
                                                    "Number of Hits on ",

                                {:xmlData =>  @monthly_data,
                                 :chartConfigs =>
                                     {
                                      :caption => "Daily Hits in the Month",
                                      :subCaption => "For the month of : #{params[:month]}",
                                      :xAxisName => "Date Range",
                                      :yAxisName => "Number of API Hits",
                                      :skipNames => 1
                                     }
                                }

    )
    render :template => "review/index"

  end



def api_hits_details

    add_breadcrumb "Api Monthly Hits ", "/api/monthly_hits"

    add_breadcrumb "Daily Hits", "/api/hits_by_month?month=#{params[:date][0..6]}"

    add_breadcrumb "Api Access details", "/api/api_hits_details"

    @api_data = ApiLogAccess.find(:all, :conditions => "date_format(log_time, '%Y/%m/%d') = '#{params[:date]}'")
   
    render :template => "api/api_details" , :locals => { :page_header => "Number of Hits on" }
  end

 
end
