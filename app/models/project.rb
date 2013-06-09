class Project < ActiveRecord::Base
  stampable

  attr_accessible :name, :description, :method, :creator_id, :updater_id, :responsible_id, :memberships_attributes
  has_many :surveys
  has_many :documents, :as => :documentable, :dependent => :destroy
  has_many :memberships

  accepts_nested_attributes_for :memberships, :allow_destroy => true

  validates_presence_of :name

  def projectdescription
  	documents.where("documenttype = ?", "Projektbeschreibung").first
  end
end
