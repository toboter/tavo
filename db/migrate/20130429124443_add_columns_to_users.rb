class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :activated, :boolean
    add_column :users, :phone, :string
    add_column :users, :fax, :string
    add_column :users, :address, :text
    add_column :users, :info, :text
    add_column :users, :vitae, :text
    add_column :users, :role, :string
  end
end
