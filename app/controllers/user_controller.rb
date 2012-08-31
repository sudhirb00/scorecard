class UserController < ApplicationController
add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "User", "/user/index"
    @user_data = User.group("date_format(user_dob, '%Y')").count
    @user_data = @user_data.sort_by { |k,v| v }.reverse

    top_rows = params[:top_rows].nil? ? 'All' : params[:top_rows]
    # select only top 5 for now.
    # @user_data = @user_data[1..top_rows.to_i]

    @str_xml = ApplicationController.generate_xml(
        '/user/users_by_year?year=',
        "Users with Yob ",
        {:xmlData =>  @user_data,
         :chartConfigs => { :caption => "Users Count by Year of Birth",
                            :subCaption => "(Showing Top #{top_rows})",
                            # :showNames => 0
                 }
        }



    )

  end

end
