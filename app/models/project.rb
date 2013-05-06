class Project < ActiveRecord::Base
  attr_accessible :name, :description, :method, :creator_id, :updater_id, :responsible_id
  has_many :surveys
  has_many :reports, :as => :reportable, :dependent => :destroy

  validates_presence_of :name, :creator_id, :updater_id, :responsible_id

  def projectdescription
  	reports.where("reporttype = ?", "Projektbeschreibung").first
  end
end
