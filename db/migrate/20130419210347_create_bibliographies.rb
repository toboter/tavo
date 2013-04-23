class CreateBibliographies < ActiveRecord::Migration
  def self.up
    create_table :bibliographies do |t|
      t.string :author
      t.string :title
      t.date :year
      t.timestamps
    end
  end

  def self.down
    drop_table :bibliographies
  end
end
