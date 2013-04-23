class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.string :title
      t.text :reporttext
      t.string :reporttype
      t.references :reportable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
