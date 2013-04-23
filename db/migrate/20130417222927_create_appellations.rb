class CreateAppellations < ActiveRecord::Migration
  def self.up
    create_table :appellations do |t|
      t.integer :site_id
      t.string :content
      t.string :period
      t.timestamps
    end
  end

  def self.down
    drop_table :appellations
  end
end
