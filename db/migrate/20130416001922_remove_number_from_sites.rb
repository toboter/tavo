class RemoveNumberFromSites < ActiveRecord::Migration
  def up
  	remove_column :sites, :number
  end

  def down
  	add_column :sites, :number, :integer
  end
end
