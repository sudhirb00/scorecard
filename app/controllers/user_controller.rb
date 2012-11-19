class UserController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_filter :authenticate

  def signups
    add_breadcrumb "User", "/user/signups"
    @monthly_data = User.group("date_format(created_date, '%Y/%m')").count(:conditions => {:created_date => '2011-01-01'..'2099-01-01'})

    @str_xml = EstablishmentController.generate_xml(
                                                    '/user/signups_by_month?month=',
                                                    "Number of Signups in ",
        {:xmlData =>  @monthly_data,
         :chartConfigs => { :caption => "Monthly Signups",
                            :subCaption => "(For Each Month)",
                            :xAxisName => "Months",
                            :yAxisName => "Number of Signups",
                            :skipNames => 3
         }
        }
      )
      render :template => "review/index"
  end
  
  def signups_by_month

    add_breadcrumb "Monthly Signups", "/user/signups"

    add_breadcrumb "Daily Signups", "/user/signups_by_month"

    @monthly_data = User.group("date_format(created_date, '%Y/%m/%d')").count(:conditions => "date_format(created_date, '%Y/%m') = '#{params[:month]}'")
    @str_xml = EstablishmentController.generate_xml('/user/signup_details?date=',
                                                    "Number of Signups on ",

                                {:xmlData =>  @monthly_data,
                                 :chartConfigs =>
                                     {
                                      :caption => "Daily Signups in the Month",
                                      :subCaption => "For the month of : #{params[:month]}",
                                      :xAxisName => "Date Range",
                                      :yAxisName => "Number of Signups",
                                      :skipNames => 7
                                     }
                                }

    )
    render :template => "review/index"

  end

  def signup_details

    add_breadcrumb "Monthly Signups", "/user/signups"

    add_breadcrumb "Daily Signups", "/user/signups_by_month?month=#{params[:date][0..6]}"

    add_breadcrumb "Signup Data", "/user/signup_details"

    @user_data = User.find(:all, :conditions => "date_format(created_date, '%Y/%m/%d') = '#{params[:date]}'")
    #render :text => @reviews_daily_data.to_yaml

    render :template => "user/user_details" , :locals => { :page_header => "User Signups on " }
  end

  def logins
    add_breadcrumb "User", "/user/logins"
    @monthly_data = User.group("date_format(lastlogin, '%Y/%m')").count(:conditions => {:lastlogin => '2011-01-01'..'2099-01-01'})

    @str_xml = EstablishmentController.generate_xml(
                                                    '/user/logins_by_month?month=',
                                                    "Number of logins in ",
        {:xmlData =>  @monthly_data,
         :chartConfigs => { :caption => "Monthly Logins",
                            :subCaption => "(For Each Month)",
                            :xAxisName => "Months",
                            :yAxisName => "Number of Logins",
                            :skipNames => 3
         }
        }
      )
      render :template => "review/index"
  end
  
  def logins_by_month

    add_breadcrumb "Monthly Logins", "/user/logins"

    add_breadcrumb "Daily Logins", "/user/logins_by_month"

    @monthly_data = User.group("date_format(lastlogin, '%Y/%m/%d')").count(:conditions => "date_format(lastlogin, '%Y/%m') = '#{params[:month]}'")
    @str_xml = EstablishmentController.generate_xml('/user/login_details?date=',
                                                    "Number of Logins on ",

                                {:xmlData =>  @monthly_data,
                                 :chartConfigs =>
                                     {
                                      :caption => "Daily Logins in the Month",
                                      :subCaption => "For the month of : #{params[:month]}",
                                      :xAxisName => "Date Range",
                                      :yAxisName => "Number of Logins",
                                      # :skipNames => 7
                                     }
                                }

    )
    render :template => "review/index"

  end

  def login_details

    add_breadcrumb "Monthly Logins", "/user/logins"

    add_breadcrumb "Daily Logins", "/user/logins_by_month?month=#{params[:date][0..6]}"

    add_breadcrumb "Login Data", "/user/login_details"

    @user_data = User.find(:all, :conditions => "date_format(lastlogin, '%Y/%m/%d') = '#{params[:date]}'")
    #render :text => @reviews_daily_data.to_yaml

    render :template => "user/user_details" , :locals => { :page_header => "User Logins on " }
  end


  def index
    add_breadcrumb "User", "/user/index"
    @user_data = User.group("date_format(user_dob, '%Y')").count
    @user_data = @user_data.sort_by { |k,v| v }.reverse

    top_rows = params[:top_rows].nil? ? 'All' : params[:top_rows]
    # select only top 5 for now.
    # @user_data = @user_data[1..top_rows.to_i]

    @str_xml = ApplicationController.generate_xml(
        '#',
        "Users with Year of Birth ",
        {:xmlData =>  @user_data,
         :chartConfigs => { :caption => "Users Count by Year of Birth",
                            :subCaption => "(Showing Top #{top_rows})",
                            # :showNames => 0
                 }
        }
    )

  end

  def reviews
    add_breadcrumb "User", "/user/index"
    @user_data = ReviewRating.group(:rev_user_name).count
    @user_data = @user_data.sort_by { |k,v| v }.reverse
    top_rows = params[:top_rows].nil? ? 20 : params[:top_rows]
    @user_data = @user_data[0..top_rows.to_i]

#    render :text => @user_data.to_yaml
    @data_for_xml = {}
    @user_data.each { |k,v |
      logger.debug( "k: #{k} , v: #{v}" )
      reviewed_user = User.first(:conditions => {:user_name => k})
      @data_for_xml [ k ] = {:key => k,
        :value => v ,
        :hover_text => "#{reviewed_user.user_fname} #{reviewed_user.user_lname}",
        :link => "/user/reviews_by_user/#{k}",
        :id => reviewed_user.user_id
      }
    }
#    render :text => @data_for_xml.to_yaml

    @str_xml = ApplicationController.generate_xml_v2(
        {:xmlData =>  @data_for_xml,
         :chartConfigs => { :caption => "Users Review Count",
                            :subCaption => "(Showing Top #{top_rows}) Only Logged-in Users",
                            # :showNames => 0
                 }
        }
 )

 render :locals =>
   { :deep_link =>       "http://timescity.com/profile/",
   }

  end

  def reviews_by_user
    add_breadcrumb "Reviews", "/user/reviews"
    add_breadcrumb "Reviews By User", "/user/reviews_by_user"
    @user_data = ReviewRating.group(:rev_rate_1).count(:conditions => {:rev_user_name => params[:rev_user_name]})
    @user_data = @user_data.sort_by { |k,v| k }.reverse
    reviewed_user = User.first(:conditions => {:user_name =>  params[:rev_user_name]})
    @data_for_xml = {}
    @user_data.each { |k,v |
      logger.debug( "k: #{k} , v: #{v}" )
      @data_for_xml [ k ] = {:key => k,
        :value => v ,
        :hover_text => "#{reviewed_user.user_fname} #{reviewed_user.user_lname}, Rating : #{k}",
        :link => "http://timescity.com/profile/#{reviewed_user.user_id}",
        :id => reviewed_user.user_id
      }
    }
#    render :text => @data_for_xml.to_yaml

    @str_xml = ApplicationController.generate_xml_v2(
        {:xmlData =>  @data_for_xml,
         :chartConfigs => { :caption => "Users Review Count",
                            :subCaption => "Split by Rating",
                            # :showNames => 0
                 }
        }
 )

 render :template => "user/reviews", :locals =>
   { :deep_link =>       "http://timescity.com/profile/",
   }

  end

  def cumsignups
    add_breadcrumb "User", "/user/cumsignups"

    @raw_monthly_data = User.group("date_format(created_date, '%Y/%m')").count(:conditions => {:created_date => '2011-01-01'..'2099-01-01'})

	cum_count = 0
	@monthly_data = {} 
	@raw_monthly_data.each { |k,v | 

		cum_count = cum_count + v  
		@monthly_data[k] = cum_count
	}

    @str_xml = EstablishmentController.generate_xml(
                                                    '',
                                                    "Number of Signups at ",
        {:xmlData =>  @monthly_data,
         :chartConfigs => { :caption => "Monthly Signups",
                            :subCaption => "(For Each Month)",
                            :xAxisName => "Months",
                            :yAxisName => "Number of Signups",
                            :skipNames => 3
         }
        }
      )
      render :template => "user/user_signup_cumulative"
  end

  def cumlogins
    add_breadcrumb "User", "/user/cumlogins"
		@raw_monthly_data = User.group("date_format(lastlogin, '%Y/%m')").count(:conditions => {:lastlogin => '2011-01-01'..'2099-01-01'})
		cum_count = 0
		@monthly_data = {} 
		@raw_monthly_data.each { |k,v | 

			cum_count = cum_count + v  
			@monthly_data[k] = cum_count
		}

	    @str_xml = EstablishmentController.generate_xml(
			                                    '',
			                                    "Number of Signups at ",
		{:xmlData =>  @monthly_data,
		 :chartConfigs => { :caption => "Monthly Logins",
			            :subCaption => "(For Each Month)",
			            :xAxisName => "Months",
			            :yAxisName => "Number of Logins",
			            :skipNames => 1
		 }
		}
	      )
	      render :template => "user/user_signup_cumulative"
   end

end
