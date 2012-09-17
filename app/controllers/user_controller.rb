class UserController < ApplicationController
add_breadcrumb "Home", :root_path
  REALM = "Enter password for Timescity Scorecard"
#  require_relative "./authenticate_data.rb" 
 USERS = {
         "tcity" => Digest::MD5.hexdigest(["tcity",REALM,"notvalid"].join(":"))}  #ha1 digest password
  
  before_filter :authenticate

  def index
    add_breadcrumb "User", "/user/index"
    @user_data = User.group("date_format(user_dob, '%Y')").count
    @user_data = @user_data.sort_by { |k,v| v }.reverse

    top_rows = params[:top_rows].nil? ? 'All' : params[:top_rows]
    # select only top 5 for now.
    # @user_data = @user_data[1..top_rows.to_i]

    @str_xml = ApplicationController.generate_xml(
        '/user/users_by_year?year=',
        "Users with Year of Birth ",
        {:xmlData =>  @user_data,
         :chartConfigs => { :caption => "Users Count by Year of Birth",
                            :subCaption => "(Showing Top #{top_rows})",
                            # :showNames => 0
                 }
        }



    )

  end

  private
    def authenticate
      authenticate_or_request_with_http_digest(REALM) do |username|
        USERS[username]
      end
    end

end
