class SitesController < ApplicationController
  before_filter :require_login, :except => [:index, :show]
  
  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    render :layout => "show_template"
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      redirect_to @site, :notice => "Successfully created site."
    else
      render :action => 'new'
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      redirect_to @site, :notice  => "Successfully updated site."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy
    redirect_to sites_url, :notice => "Successfully destroyed site."
  end
end
