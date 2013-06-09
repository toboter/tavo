class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :creator_id
      t.integer :updater_id
      t.string :name
      t.string :task

      t.timestamps
    end
  end
end
