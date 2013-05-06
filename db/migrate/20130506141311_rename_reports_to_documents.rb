class RenameReportsToDocuments < ActiveRecord::Migration
  def change
	rename_table :reports, :documents
	rename_column :documents, :reportable_type, :documentable_type
	rename_column :documents, :reportable_id, :documentable_id
	rename_column :documents, :reporttype, :documenttype
	rename_column :documents, :reporttext, :content
	add_column :documents, :author_id, :integer
	add_column :documents, :creator_id, :integer
	add_column :documents, :updater_id, :integer
  end
end
