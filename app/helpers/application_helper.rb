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
  
  def author_name (id)
    return 'n/a' if id.nil?
    author = Author.find(id)
    author.author_name
  end
  
  def events_details_link (k, field_to_use, label_to_use)
    
  text = k < 0 ? "#{k.abs} weeks before" : "#{k} weeks after"
    
  return "<a href='/event/events_listing?post_gap=#{k}&field_to_use=#{field_to_use}&label=#{label_to_use}'>#{text}</a>"

  end
  
  
  def display_date(input_date)
    return 'N/A' if input_date.nil?
    return input_date.strftime("%d-%b-%y %l:%M%p")
  end

  def display_establishment(id, label)
  est = Establishment.unscoped.find(id)
  return "<a href='http://timescity.com#{est.est_guid}' alt='#{est.est_add1} #{est.est_loc_name}, #{est.est_city_name}' title='#{est.est_add1} #{est.est_loc_name}, #{est.est_city_name}'>#{label}</a>"
  end

  def display_movie(id, label)
  movie = Movie.find(id)
  return "<a href='http://timescity.com/delhi#{movie.guid}' alt='#{movie.cSynopsis}' title='#{movie.cSynopsis}'>#{label}</a>"
  end

  def PaidToText(paid)

    (paid == 0 ? "Not Paid" : "Paid")
  end

end
