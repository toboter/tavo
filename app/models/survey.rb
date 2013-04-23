class Survey < ActiveRecord::Base
  attr_accessible :project_id, :number, :site_id
  belongs_to :project
  belongs_to :site
  has_many :visits
end
