class HomeController < ApplicationController
  add_breadcrumb "Home", :root_path
   before_filter :authenticate

  def index
  end

end
