class Visit < ActiveRecord::Base
  attr_accessible :start_date, :end_date, :reports_attributes
  belongs_to :survey
  has_many :imagetags, :as => :imageable, :dependent => :destroy
  has_many :images, :through => :imagetags

  has_many :reports, :as => :reportable, :dependent => :destroy

  accepts_nested_attributes_for :reports, :reject_if => lambda { |a| a[:reporttext].blank? }, :allow_destroy => true
end