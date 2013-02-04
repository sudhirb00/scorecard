class MisController < ApplicationController
  add_breadcrumb "Home", :root_path
   before_filter :authenticate

  def home
  	    @log_access_est_hash = begin
         YAML.load(File.open("log_access_est.yml"))
         rescue ArgumentError => e
          puts "Could not parse YAML: #{e.message}"
        end

       puts @log_access_est_hash.inspect 
  end
 
end
