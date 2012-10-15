class EventController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_filter :authenticate


  def listed_weeks_before_start

    add_breadcrumb "Listed Before Start Date", "/user/listed_weeks_before_start"
    @str_xml = listed_weeks_before("dde_start_date", "start date")
    
    render  :locals => { 
      :field_to_use => "dde_start_date", :label_to_use => "start date"
    }
  end

  def listed_weeks_before_end

    add_breadcrumb "Listed Before End Date", "/user/listed_weeks_before_end"
    @str_xml = listed_weeks_before("dde_end_date", "end date")
    
    render :template => "event/listed_weeks_before_start",:locals => { 
      :field_to_use => "dde_end_date", :label_to_use => "end date"
    }
  end



  
  def listed_weeks_before (field_to_use, label_to_use)


    @events_data = Event.group("yearweek(insert_date) - yearweek (#{field_to_use}) ").count

    logger.debug(@events_data)
      @events_data.tap { |hs| hs.delete(nil) }
      @events_data.tap { |hs| hs.delete(0) }

     @events_data = @events_data.sort_by { |k,v| k }

      @data_for_xml = {}
      @events_data.each { |k,v |
        @data_for_xml [ k ] = {:key => k,
          :value => k < 0 ? -v : v ,
          :hover_text => "#{v} Events posted #{k.abs} weeks #{k < 0 ? "before" : "after"} event #{label_to_use}",
          :link => "/event/events_listing?post_gap=#{k}&field_to_use=#{field_to_use}&label=#{label_to_use}"
        }
      }

      @str_xml = ApplicationController.generate_xml_v2(
          {:xmlData =>  @data_for_xml,
           :chartConfigs => { :caption => "Events Posted",
                              :subCaption => "Number of weeks before #{label_to_use}",
                              # :xAxisName => "Number of Weeks",
                              :yAxisName => "Number of Events" ,
                              :showNames => 0 ,
                              :showValues => 0,
                              :hoverCapSepChar => '',
                              :rotateNames => 0,
                              :skipNames => 5
                   }
          }
   )

      
  return @str_xml    
      
  end

  def events_listing
  
    @events_data = Event.find(:all, 
      :conditions => "yearweek(insert_date) -  yearweek (#{params[:field_to_use]})  = #{params[:post_gap]}")
    #render :text => @events_data.count.to_yaml

    week_label = params[:post_gap].to_i < 0 ? "#{params[:post_gap]} weeks before" : 
        "#{params[:post_gap].to_i.abs} weeks after"
    render :locals => { :page_header => 
      "Events Listing for events listed #{week_label} #{params[:label]}" 
    }
 
  end
  

end
