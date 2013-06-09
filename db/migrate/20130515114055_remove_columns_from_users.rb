class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :first_name
	remove_column :users, :last_name
	remove_column :users, :phone
	remove_column :users, :fax
	remove_column :users, :address
	remove_column :users, :info
	remove_column :users, :vitae
  end

end
