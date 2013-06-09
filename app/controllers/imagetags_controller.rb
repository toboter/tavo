class ImagetagsController < ApplicationController
  def index
    @imagetags = Imagetag.all
  end

  def show
    @imagetag = Imagetag.find(params[:id])
    @image = @imagetag.image
  end

  def new
    @imagetag = Imagetag.new(:imageable_id => params[:imageable_id], :imageable_type => params[:imageable_type])
    image = @imagetag.build_image
  end

  def create
    @imagetag = Imagetag.new(params[:imagetag])
    if params[:image_ids]
      params[:image_ids].each do |image_id|
        Imagetag.where(:image_id => image_id, 
          :imageable_type => @imagetag.imageable_type, 
          :imageable_id => @imagetag.imageable_id).first_or_create
      end
      if @imagetag.imageable_type = 'Visit'
        redirect_to survey_visit_url(@imagetag.imageable.survey, @imagetag.imageable), :notice => "Die Bilder wurden dem Besuch hinzugefuegt."
      else
        redirect_to surveys_url, :notice => "Es gibt zwar schwierigkeiten mit der Weiterleitung, aber die Bilder sind irgendwo."
      end
    else
    
    if @imagetag.save
      redirect_to @imagetag, :notice => "Successfully created imagetag."
    else
      render :action => 'new'
    end
    end
  end

  def edit
    @imagetag = Imagetag.find(params[:id])
  end

  def update
    @imagetag = Imagetag.find(params[:id])
    if @imagetag.update_attributes(params[:imagetag])
      redirect_to @imagetag, :notice  => "Successfully updated imagetag."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @imagetag = Imagetag.find(params[:id])
    @imagetag.destroy
    redirect_to :back, :notice => "Successfully destroyed imagetag."
  end


end
