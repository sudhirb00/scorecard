# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Scorecard::Application.initialize!

PIE_CHARTS_WIDTH = 800
PIE_CHARTS_HEIGHT = 600

LINE_CHARTS_WIDTH = 600
LINE_CHARTS_HEIGHT = 400

DEFAULT_CHART_CONFIGS = { :caption=>'Title', :subCaption=>"Sub Title",
    :showNames=>'1', :decimalPrecision=>'0',
    :rotateNames => '1',
    :formatNumberScale=>'0',
    :numberSuffix=>'',
    :pieYScale => 60,
    :canvasBgAlpha => '40',
    :showCanvasBg => 0,
    :bgColor => 'F1f1f1',
    :pieRadius => 200,
    :hoverCapSepChar => " - ",
}

PIE_CHART_GRAPH_TYPE = "FCF_Doughnut2D.swf"

TC_REALM = "Enter password for Timescity Scorecard"
TC_GOGGLES_REALM = "Enter password for Timescity Scorecard Goggles"

AUTHORIZED_USERS = {
        "tcity" => Digest::MD5.hexdigest(["tcity",TC_REALM,"tcity"].join(":"))} #ha1 digest password
        
AUTHORIZED_GOGGLES_USERS = {
                "tcityg" => Digest::MD5.hexdigest(["tcityg",TC_GOGGLES_REALM,"tcityg"].join(":"))} #ha1 digest password
        
        
TC_SOLR_SERVERS = {
      1 => {
            :url => 'http://192.169.30.104:8080/timescity_newschema_v1/mainsearch/',
            :user => 'tomcat',
            :password => 'password@!)$'
            },
      2 => {
            :url => 'http://192.169.30.203:8080/timescity_newschema_v1/mainsearch/',
            :user => 'timecity',
            :password => 'timescity20330'
            },
      3 => {
            :url => 'http://192.169.30.103:8080/timescity_newschema_v1/mainsearch/',
            :user => 'timescity',
            :password => 'timescity10330'
            },
                          
       }                   
        