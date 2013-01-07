class HomeController < ApplicationController
  add_breadcrumb "Home", :root_path
   before_filter :authenticate

  def index
  
  end


  def rel_notes
  
  end
  
  def xss_demo

  end
  
  
end
