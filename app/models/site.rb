class Site < ActiveRecord::Base
  stampable
  attr_accessible :name, :district_id, :appellations_attributes, :creator_id, :updater_id, :latitude, :longitude, :gmaps
  has_many :surveys, :dependent => :destroy
  has_many :appellations, :dependent => :destroy

  belongs_to :district

  validates_presence_of :name, :district_id

  accepts_nested_attributes_for :appellations, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true


end
