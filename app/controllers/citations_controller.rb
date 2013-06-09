class CitationsController < ApplicationController
  def index
    @citations = Citation.all
  end

  def show
    @citation = Citation.find(params[:id])
  end

  def new
    @citation = Citation.new(:citable_id => params[:citable_id], :citable_type => params[:citable_type])
  end

  def create
    @citation = Citation.new(params[:citation])
    if @citation.save
      redirect_to @citation, :notice => "Successfully created citation."
    else
      render :action => 'new'
    end
  end

  def edit
    @citation = Citation.find(params[:id])
  end

  def update
    @citation = Citation.find(params[:id])
    if @citation.update_attributes(params[:citation])
      redirect_to @citation, :notice  => "Successfully updated citation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @citation = Citation.find(params[:id])
    @citation.destroy
    redirect_to citations_url, :notice => "Successfully destroyed citation."
  end
end
