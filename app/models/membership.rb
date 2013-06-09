class Membership < ActiveRecord::Base
  stampable
  attr_accessible :creator_id, :project_id, :task, :updater_id, :person_id

  belongs_to :project
  belongs_to :person

  validates_presence_of :project_id, :person_id

  TASKS = %w[Projektleiter Vermessung etc pp]

end
