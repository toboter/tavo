class AddCreatorColumnsToSomeTables < ActiveRecord::Migration
  def change
  	add_column :imagetags, :creator_id, :integer
  	add_column :imagetags, :updater_id, :integer
  	add_column :images, :creator_id, :integer
  	add_column :images, :updater_id, :integer
  	add_column :images, :author_id, :integer
  	add_column :images, :original_date, :date
  	add_column :images, :name, :string
  	add_column :appellations, :creator_id, :integer
  	add_column :appellations, :updater_id, :integer
  	add_column :districts, :creator_id, :integer
  	add_column :districts, :updater_id, :integer
  	add_column :visits, :creator_id, :integer
  	add_column :visits, :updater_id, :integer
  	add_column :surveys, :creator_id, :integer
  	add_column :surveys, :updater_id, :integer
  	add_column :sites, :creator_id, :integer
  	add_column :sites, :updater_id, :integer
  	add_column :sites, :latitude, :float
  	add_column :sites, :longitude, :float
  	add_column :sites, :gmaps, :boolean
  end
end
