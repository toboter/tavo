class AddColumnsToImages < ActiveRecord::Migration
  def change
    add_column :images, :imagetype, :string
  end
end
