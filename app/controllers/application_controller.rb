class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'active_support/builder'

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
                    :link => "#{link_url}" + "#{k}",
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

  def self.format_xAxis(str)
      @parts = str.split("/");
      logger.debug(@parts.to_yaml)
      logger.debug(@parts[1])
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
end
