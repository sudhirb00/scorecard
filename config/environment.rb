# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Scorecard::Application.initialize!

PIE_CHARTS_WIDTH = 800
PIE_CHARTS_HEIGHT = 600

DEFAULT_CHART_CONFIGS = { :caption=>'Title', :subCaption=>"Sub Title",
    :showNames=>'1', :decimalPrecision=>'0',
    :rotateNames => '1',
    :formatNumberScale=>'0',
    :numberSuffix=>'',
    :pieYScale => 60,
    :bgSWF => '/assets/backgrounds/fruits2.jpg',
    :canvasBgAlpha => '40',
    :showCanvasBg => 0,
    :bgColor => 'F1f1f1',
    :pieRadius => 200,
    :hoverCapSepChar => " - ",
}

PIE_CHART_GRAPH_TYPE = "FCF_Doughnut2D.swf"