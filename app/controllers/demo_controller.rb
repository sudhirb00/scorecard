require 'gruff'

class DemoController < ApplicationController

  def index

    g = Gruff::Line.new
    g.title = "Search Data"

    g.data("Delhi", [12345, 13543, 15332, 12343, 16542, 18735])
    g.data("Mumbai", [11345, 12543, 15332, 13343, 14542, 16735])
    g.data("Kolkata", [7876, 8787, 9654, 12343, 11888, 12735])
    g.data("Chennai", [9872, 8962, 11232, 12331, 11253, 13475])

    g.labels = {0 => 'Jan 2012', 2 => 'Apr 2012', 4 => 'Jul 2012'}

    filename = 'my_search_graph.png'

    # this writes the file to the hard drive for caching
    # and then writes it to the screen.
    #
    g.write(filename)
    send_file filename, :type => 'image/png', :disposition => 'inline'

  end


end
