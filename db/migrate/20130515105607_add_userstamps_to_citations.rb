class AddUserstampsToCitations < ActiveRecord::Migration
  def change
  	add_column :citations, :creator_id, :integer
  	add_column :citations, :updater_id, :integer
  end
end
