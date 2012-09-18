class UserController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_filter :authenticate

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

end
