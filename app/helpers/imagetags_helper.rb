module ImagetagsHelper
  def set_path_from_imageable(imagetag)
  	if imagetag.imageable_type == "Visit"
  	  survey_visit_path(imagetag.imageable.survey, imagetag.imageable)
  	else
  	  polymorphic_path(imagetag.imageable)
  	end
  end

end
