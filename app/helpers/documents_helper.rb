module DocumentsHelper
  def select_document_type(type)
  	if type == "Project"
	    Document::PROJECTTYPES
	  else
	   Document::DOCUMENTTYPES
	  end
  end

  def set_path_from_documentable(document)
  	if document.documentable_type == "Visit"
  	  survey_visit_path(document.documentable.survey, document.documentable)
  	else
  	  polymorphic_path(document.documentable)
  	end
  end
end
