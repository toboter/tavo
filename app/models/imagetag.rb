class Imagetag < ActiveRecord::Base
  attr_accessible :image_id, :imageable_id, :imageable_type
  belongs_to :imageable, :polymorphic => true
  belongs_to :image
  

  validates_presence_of :image_id, :imageable_type, :imageable_id

  def not_assigned_to
  	imageable.images
  end
end
