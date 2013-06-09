class District < ActiveRecord::Base
  attr_accessible :name, :country, :museum_address, :creator_id, :updater_id
  stampable
  has_many :sites

  validates_presence_of :name
end
