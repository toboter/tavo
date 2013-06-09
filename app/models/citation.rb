class Citation < ActiveRecord::Base
  attr_accessible :reference_id, :target, :creator_id, :updater_id
  stampable

  belongs_to :citable, :polymorphic => true
  belongs_to :reference
end
