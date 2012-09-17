module ApplicationHelper

  require "fusion_charts_helper"
  include FusionChartsHelper

  def encode_url (str)
    CGI.escape(str)
  end  
end
