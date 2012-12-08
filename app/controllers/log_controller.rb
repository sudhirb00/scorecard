class LogController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_filter :authenticate
	
  def monthly_hits
  add_breadcrumb "Monthly Hits", "/log/monthly_hits"
    @monthly_data = LogAccess.group("date_format(log_time, '%Y/%m')").count(:conditions => {:log_time => '2011-01-01'..'2099-01-01'})
    @str_xml = EstablishmentController.generate_xml(
                                                    '/log/hits_by_month?month=',
                                                    "Number of Hits in ",
        {:xmlData =>  @monthly_data,
         :chartConfigs => { :caption => "Monthly Log Hits",
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

    add_breadcrumb "Monthly Hits", "/log/monthly_hits"

    add_breadcrumb "Daily Hits", "/log/hits_by_month"

    @monthly_data = LogAccess.group("date_format(log_time, '%Y/%m/%d')").count(:conditions => "date_format(log_time, '%Y/%m') = '#{params[:month]}'")
    @str_xml = EstablishmentController.generate_xml('/log/log_details?date=',
                                                    "Number of Hits on ",

                                {:xmlData =>  @monthly_data,
                                 :chartConfigs =>
                                     {
                                      :caption => "Daily Hits in the Month",
                                      :subCaption => "For the month of : #{params[:month]}",
                                      :xAxisName => "Date Range",
                                      :yAxisName => "Number of Hits",
                                      :skipNames => 1
                                     }
                                }

    )
    render :template => "review/index"

  end



def log_details

    add_breadcrumb "Monthly Hits ", "/log/monthly_hits"

    add_breadcrumb "Daily Hits", "/log/hits_by_month?month=#{params[:date][0..6]}"

    add_breadcrumb "Log Details", "/log/log_details"

    @log_data = LogAccess.find(:all, :conditions => "date_format(log_time, '%Y/%m/%d') = '#{params[:date]}'")
   
    render :template => "log/log_details" , :locals => { :page_header => "Number of Hits on" }
  end

  def cum_monthly_hits
    add_breadcrumb "Monthly Cumulative Hits", "/log/cum_monthly_hits"
        @raw_monthly_data = LogAccess.group("date_format(log_time, '%Y/%m')").count(:conditions => {:log_time => '2011-01-01'..'2099-01-01'})
	cum_count = 0
	@monthly_data = {} 
	@raw_monthly_data.each { |k,v | 

		cum_count = cum_count + v  
		@monthly_data[k] = cum_count
	}
       @str_xml = EstablishmentController.generate_xml(
                                                    '',
                                                    "Number of Hits At ",
        {:xmlData =>  @monthly_data,
         :chartConfigs => { :caption => "Monthly Log Hits",
                            :subCaption => "(For Each Month)",
                            :xAxisName => "Months",
                            :yAxisName => "Number of Hits",
                            :skipNames => 1
         }
        }
      )

       render :template => "user/user_signup_cumulative"

   end


 
end
