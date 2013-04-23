class Imagetag < ActiveRecord::Base
  attr_accessible :image_id, :imageable_id, :imageable_type, :image_attributes
  belongs_to :imageable, :polymorphic => true
  belongs_to :image
  
  accepts_nested_attributes_for :image
end
