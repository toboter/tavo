class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text
    add_column :projects, :method, :text
    add_column :projects, :creator_id, :integer
    add_column :projects, :updater_id, :integer
    add_column :projects, :responsible_id, :integer
  end
end
