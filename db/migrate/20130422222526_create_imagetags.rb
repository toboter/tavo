class CreateImagetags < ActiveRecord::Migration
  def self.up
    create_table :imagetags do |t|
      t.integer :image_id
      t.integer :imageable_id
      t.string :imageable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :imagetags
  end
end
