class District < ActiveRecord::Base
  attr_accessible :name, :country, :museum_address
  has_many :sites

  validates_presence_of :name
end
