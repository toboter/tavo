class District < ActiveRecord::Base
  attr_accessible :name, :country, :museum_address
  has_many :sites
end
