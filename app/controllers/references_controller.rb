class ReferencesController < ApplicationController
  def index
    @references = Reference.roots
    render :layout => "index_template"
  end

  def show
    @reference = Reference.find(params[:id])
    @articles = @reference.children
    render :layout => "show_template"
  end

  def new
    @reference = Reference.new(:parent_id => params[:parent_id])
  end

  def create
    @reference = Reference.new(params[:reference])
    if @reference.save
      redirect_to @reference, :notice => "Successfully created reference."
    else
      render :action => 'new'
    end
  end

  def edit
    @reference = Reference.find(params[:id])
  end

  def update
    @reference = Reference.find(params[:id])
    if @reference.update_attributes(params[:reference])
      redirect_to @reference, :notice  => "Successfully updated reference."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    redirect_to references_url, :notice => "Successfully destroyed reference."
  end
end
