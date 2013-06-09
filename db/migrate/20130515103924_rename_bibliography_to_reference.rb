class RenameBibliographyToReference < ActiveRecord::Migration
  def change
  	rename_table :bibliographies, :references
  	remove_column :references, :author
  	add_column :references, :creator_id, :integer
  	add_column :references, :updater_id, :integer
  	add_column :references, :edited_by_authors, :boolean, :default => false
  	add_column :references, :publishing_place, :string
  	rename_column :citations, :bibliography_id, :reference_id
  end
end
