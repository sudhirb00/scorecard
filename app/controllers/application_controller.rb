class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'active_support/builder'

  def self.hello
    "Hello world"
  end

  # @return [String]
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


  def self.generate_xml (caption='', subcaption='', link_url = nil, hoverText, xmldata)
    xml = Builder::XmlMarkup.new()
    xml.graph(:caption=>caption, :subCaption=>subcaption,
              :showNames=>'1', :decimalPrecision=>'0',
              :rotateNames => '1',
              :formatNumberScale=>'0',
              :numberSuffix=>'',
              :pieYScale => 60,
              # :bgSWF => '/assets/tc-logo.gif'
              :bgColor => 'F1f1f1',
              :pieRadius => 300,
              :hoverCapSepChar => " - "

              ) do

     #defaults for various graphs

      xmldata.each { |k,v|          xml.set(:name=>k,:value=>v,
                    :link => "#{link_url}" + "#{k}",
                    :hoverText => "#{hoverText}" + "#{k}"
                        )
                    }

    end
    return xml
  end
end
