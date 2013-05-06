class Site < ActiveRecord::Base
  attr_accessible :name, :district_id, :appellations_attributes
  has_many :surveys
  has_many :appellations, :dependent => :destroy
  has_many :citations, :as => :citable, :dependent => :destroy
  belongs_to :district

  validates_presence_of :name, :district_id

  accepts_nested_attributes_for :appellations, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
