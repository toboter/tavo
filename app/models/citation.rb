class Citation < ActiveRecord::Base
  attr_accessible :bibliography_id, :target
  belongs_to :citable, :polymorphic => true
  has_many :bibliographies
end
