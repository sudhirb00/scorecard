class ScorecardController < ApplicationController
  add_breadcrumb "Home", :root_path
   before_filter :authenticate

   def goggles_on
    cookies[:timescity_goggles] = 1
    redirect_to params[".done"]
  end
  
  def goggles_off
    cookies[:timescity_goggles] = 0
    redirect_to params[".done"]
  end
  
  private
    def authenticate
      authenticate_or_request_with_http_digest(TC_GOGGLES_REALM) do |username|
         AUTHORIZED_GOGGLES_USERS[username]
      end
    end

  
end
