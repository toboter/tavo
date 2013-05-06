class DiscoverController < ApplicationController
  def index
  	@sites = Site.limit(3)
  	render :layout => "index_template"
  end
end
