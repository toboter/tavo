class AddSurveyIdToVisit < ActiveRecord::Migration
  def change
    add_column :visits, :survey_id, :integer
  end
end
