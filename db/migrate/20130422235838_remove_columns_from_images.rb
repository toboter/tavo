class RemoveColumnsFromImages < ActiveRecord::Migration
  def up
  	remove_column :images, :imageable_id
  	remove_column :images, :imageable_type
  end

  def down
  	add_column :images, :imageable_id, :integer
  	add_column :images, :imageable_type, :string
  end
end
