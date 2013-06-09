class Visit < ActiveRecord::Base
  stampable
  attr_accessible :start_date, :end_date, :documents_attributes, :creator_id, :updater_id
  belongs_to :survey
  has_many :imagetags, :as => :imageable, :dependent => :destroy
  has_many :images, :through => :imagetags
  has_many :documents, :as => :documentable, :dependent => :destroy

  accepts_nested_attributes_for :documents, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  validates_presence_of :start_date, :end_date
end