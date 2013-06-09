class Survey < ActiveRecord::Base
  stampable
  attr_accessible :project_id, :number, :site_id, :creator_id, :updater_id, :citations_attributes
  belongs_to :project
  belongs_to :site
  has_many :visits
  has_many :citations, :as => :citable, :dependent => :destroy
  has_many :references, :through => :citations

  accepts_nested_attributes_for :citations, :reject_if => lambda { |a| a[:reference_id].blank? }, :allow_destroy => true
  
  validates_presence_of :project_id, :number, :site_id
end
