class CreateCitations < ActiveRecord::Migration
  def self.up
    create_table :citations do |t|
      t.integer :bibliography_id
      t.string :target
      t.references :citable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :citations
  end
end
