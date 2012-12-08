class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'active_support/builder'
  require 'cgi'
  
  def self.data_to_xml
    "<graph caption='Monthly Unit Sales'
          rotateNames = '1',
          subCaption = 'sub title' xAxisName='Month' yAxisName='Units'   \
          showNames='1' decimalPrecision='0' formatNumberScale='0'>  \
    <set name='Jan' value='462' color='AFD8F8' />       \
    <set name='Feb' value='857' color='F6BD0F' />       \
    <set name='Mar' value='671' color='8BBA00' />       \
    <set name='Apr' value='494' color='FF8E46' />       \
    <set name='May' value='761' color='008E8E' />       \
    <set name='Jun' value='960' color='D64646' />       \
    <set name='Jul' value='629' color='8E468E' />       \
    <set name='Aug' value='622' color='588526' />       \
    <set name='Sep' value='376' color='B3AA00' />       \
    <set name='Oct' value='494' color='008ED6' />       \
    <set name='Nov' value='761' color='9D080D' />       \
    <set name='Dec' value='960' color='A186BE' />       \
    </graph>"
  end


  def self.generate_xml ( link_url = nil,  hoverText, xml_config
            )
    @chart_config =  nil
    @chart_config =  DEFAULT_CHART_CONFIGS

    xml_config[:chartConfigs].each do |k, v|
      @chart_config[k] = v
    end

    xml = Builder::XmlMarkup.new()
    counter = 0
    xml.graph(@chart_config) do

     #defaults for various graphs

      xml_config[:xmlData].each do  |k,v|

        showNames = 1

        if ! (@chart_config[:skipNames].nil?)
          showNames = (counter % @chart_config[:skipNames]) == 0 ? '1' : '0'
        end
        xml.set(:name=>format_xAxis(k),:value=>v,
                    :link => "#{CGI.escape(link_url)}" + "#{k}",
                    :hoverText => "#{hoverText}" + "#{k}" ,
                    :showName => showNames
                    )
        counter += 1

      end

    end

    #options.each { |k,v |

    #  xml.graph["caption"] = 'v'

    #}
    ret_val = xml.to_s
    ret_val = ret_val.gsub(/[']/, '\\\\\'')
    return ret_val
  end

  def self.generate_xml_v2 (xml_config)
    
    @chart_config =  nil
    @chart_config =  DEFAULT_CHART_CONFIGS

    xml_config[:chartConfigs].each do |k, v|
      @chart_config[k] = v
    end

    
    xml = Builder::XmlMarkup.new()
    counter = 0
    xml.graph(@chart_config) do

      xml_config[:xmlData].each do  |xmlKey, xmlDataRow|
        showNames = 1
        if ! (@chart_config[:skipNames].nil?)
          showNames = (counter % @chart_config[:skipNames]) == 0 ? '1' : '0'
        end
        xml.set(:name=>xmlKey,
                :value=>xmlDataRow[:value],
                :link => "#{CGI.escape(xmlDataRow[:link])}",
                :hoverText => "#{xmlDataRow[:hover_text]}" ,
                :showName => showNames
                    )
        counter += 1

      end

    end

    ret_val = xml.to_s
    ret_val = ret_val.gsub(/[']/, '\\\\\'')
    return ret_val
  end

  def self.generate_stacked_xml (xml_config)
    
    @chart_config =  nil
    @chart_config =  DEFAULT_CHART_CONFIGS

    xml_config[:chartConfigs].each do |k, v|
      @chart_config[k] = v
    end

    
    xml = Builder::XmlMarkup.new()
    xml.graph(@chart_config) do

    xml.categories() do
      xml_config[:xmlData].each do  |xmlKey, xmlDataRow|

        xml.category(:name => xmlKey)
      end  
          
    end

    xml.dataset(:seriesName => "Establishments", :color => "008040" ) do
      xml_config[:xmlData].each do  |xmlKey, xmlDataRow|
      #logger.debug("Hi : ")
      #logger.debug( xmlDataRow)
      number = xmlDataRow[:value]["Establishments"].nil? ? 0 : xmlDataRow[:value]["Establishments"][:total]

        xml.set(:value => number,
                :link => "#{xmlDataRow[:link]}#{xmlDataRow[:key]}"
                )
      end  
          
    end

 
    xml.dataset(:seriesName => "Movies", :color => "FFFF00") do
      xml_config[:xmlData].each do  |xmlKey, xmlDataRow|
      
      number = xmlDataRow[:value]["Movies"].nil? ? 0 : xmlDataRow[:value]["Movies"][:total]
        xml.set(:value => number,
        :link => "#{xmlDataRow[:link]}#{xmlDataRow[:key]}"
        )
      end  
          
    end

      

    end

    ret_val = xml
    # ret_val = ret_val.gsub(/[']/, '\\\\\'')
    return ret_val
  end


  def self.format_xAxis(str)
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
  def self.short_month_name (month_num)
    MONTHS[month_num]
  end
  
  private
    def authenticate
      authenticate_or_request_with_http_digest(TC_REALM) do |username|
         AUTHORIZED_USERS[username]
      end
    end
 
end
