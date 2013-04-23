class BibliographiesController < ApplicationController
  def index
    @bibliographies = Bibliography.all
  end

  def show
    @bibliography = Bibliography.find(params[:id])
  end

  def new
    @bibliography = Bibliography.new
  end

  def create
    @bibliography = Bibliography.new(params[:bibliography])
    if @bibliography.save
      redirect_to @bibliography, :notice => "Successfully created bibliography."
    else
      render :action => 'new'
    end
  end

  def edit
    @bibliography = Bibliography.find(params[:id])
  end

  def update
    @bibliography = Bibliography.find(params[:id])
    if @bibliography.update_attributes(params[:bibliography])
      redirect_to @bibliography, :notice  => "Successfully updated bibliography."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bibliography = Bibliography.find(params[:id])
    @bibliography.destroy
    redirect_to bibliographies_url, :notice => "Successfully destroyed bibliography."
  end
end
