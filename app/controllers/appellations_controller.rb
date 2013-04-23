class AppellationsController < ApplicationController
  def index
    @appellations = Appellation.all
  end

  def show
    @appellation = Appellation.find(params[:id])
  end

  def new
    @appellation = Appellation.new
  end

  def create
    @appellation = Appellation.new(params[:appellation])
    if @appellation.save
      redirect_to @appellation, :notice => "Successfully created appellation."
    else
      render :action => 'new'
    end
  end

  def edit
    @appellation = Appellation.find(params[:id])
  end

  def update
    @appellation = Appellation.find(params[:id])
    if @appellation.update_attributes(params[:appellation])
      redirect_to @appellation, :notice  => "Successfully updated appellation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @appellation = Appellation.find(params[:id])
    @appellation.destroy
    redirect_to appellations_url, :notice => "Successfully destroyed appellation."
  end
end
