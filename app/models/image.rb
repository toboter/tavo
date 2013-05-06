class Image < ActiveRecord::Base
  attr_accessible :description, :imagefile, :imagetype
  has_many :imagetags
  has_many :visits, :through => :imagetags, :source => :imageable, :source_type => 'Visit'

  mount_uploader :imagefile, ImagefileUploader

  validates_presence_of :description, :imagetype

IMAGETYPES = %w[Ansicht Plan Skizze Karte]
end
