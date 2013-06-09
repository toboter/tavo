class AddAncestryToReferences < ActiveRecord::Migration
  def change
    add_column :references, :ancestry, :string
    add_column :references, :first_page, :string
    add_column :references, :last_page, :string
    remove_column :references, :edited_by_authors
    add_column :references, :referencetype, :string
    add_column :references, :alternative_author, :string
    add_column :references, :volume_number, :string

    add_index :references, :ancestry
  end
end

