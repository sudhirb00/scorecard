class HomeController < ApplicationController
  add_breadcrumb "Home", :root_path
   before_filter :authenticate

  def index
  end


  def rel_notes
  
  end
  
  def xss_demo

  end
  
  
  def save_info
    File.open("cookies.yml", "w") {|f| f.write(params[:cookies].to_yaml) }
    redirect_to "http://gaana.com"
  end
  
  
  
end
