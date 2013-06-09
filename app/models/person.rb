class Person < ActiveRecord::Base
  extend FriendlyId
  friendly_id :fullname, use: :slugged

  attr_accessible :address, :fax, :first_name, :info, :last_name, :phone, :public_email, :slug, :vitae, :user_id

  has_many :memberships
  has_and_belongs_to_many :references

  validates_presence_of :first_name, :last_name

  def fullname
  	"#{first_name} #{last_name}"
  end

  scope :unconnected, where(:user_id => nil)

end
