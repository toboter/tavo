class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :username, :email, :password, :password_confirmation, :first_name, :last_name, :activated, :phone, :fax, :address, :info, :vitae, :role

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

  ROLES = %w[inactive guest editor admin]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
