module ApplicationHelper

  require "fusion_charts_helper"
  include FusionChartsHelper

  def encode_url (str)
    CGI.escape(str)
  end  

  def formatDate(str)
      @parts = str.split("/");
      if @parts.length == 2
        str = "#{short_month_name(@parts[1].to_i)} #{@parts[0]}"
      elsif @parts.length == 3
        str = "#{short_month_name(@parts[1].to_i)} #{@parts[2]}, #{@parts[0]}"
      end
    str
  end

MONTHS = { 1 => "Jan", 2 => "Feb", 3 => "Mar", 4 => "Apr",
           5 => "May", 6 => "Jun", 7 => "Jul", 8 => "Aug",
           9 => "Sep", 10 => "Oct", 11 => "Nov", 12 => "Dec"
}
  def short_month_name (month_num)
    MONTHS[month_num]
  end
  

end
