class VisitsController < ApplicationController
  def index
    @survey = Survey.find(params[:survey_id])
    @visits = @survey.visits.all
  end

  def show
    @visit = Visit.find(params[:id])
    render :layout => "show_template"
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @visit = @survey.visits.build
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @visit = @survey.visits.build(params[:visit])
    if @visit.save
      redirect_to survey_visit_url(@visit.survey, @visit), :notice => "Successfully created visit."
    else
      render :action => 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @visit = @survey.visits.find(params[:id])
  end

  def update
    @visit = Visit.find(params[:id])
    if @visit.update_attributes(params[:visit])
      redirect_to survey_visit_url(@visit.survey, @visit), :notice  => "Successfully updated visit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to survey_visits_url(@visit.survey), :notice => "Successfully destroyed visit."
  end
end
