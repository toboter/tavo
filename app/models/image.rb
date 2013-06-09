class Image < ActiveRecord::Base
  attr_accessible :description, :imagefile, :imagetype, :creator_id, :updater_id, :author_id, :original_date, :name, :imageable_id, :imageable_type
  stampable
  has_many :imagetags, :dependent => :destroy
  has_many :visits, :through => :imagetags, :source => :imageable, :source_type => 'Visit'

  mount_uploader :imagefile, ImagefileUploader

  validates_presence_of :name, :description, :imagetype, :imagefile

  IMAGETYPES = %w[Ansicht Plan Skizze Karte]

  attr_accessor :imageable_id, :imageable_type
  after_save :assign_imagetag

  private

  def assign_imagetag
    if @imageable_id && @imageable_type
      Imagetag.create :image_id => self.id, :imageable_id => @imageable_id, :imageable_type => @imageable_type
    end
  end
end
