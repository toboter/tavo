module ReportsHelper
  def select_report_type(type)
  	if type == "Project"
	  Report::PROJECTTYPES
	else
	  Report::REPORTTYPES
	end
  end

  def set_path_from_reportable(report)
  	if report.reportable_type == "Visit"
  	  survey_visit_path(report.reportable.survey, report.reportable)
  	else
  	  polymorphic_path(report.reportable)
  	end
  end
end
