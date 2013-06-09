class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :fax
      t.text :address
      t.text :info
      t.text :vitae
      t.string :public_email
      t.string :slug
      t.integer :user_id

      t.timestamps
    end
    add_index :people, :slug, unique: true
    rename_column :memberships, :user_id, :person_id
    remove_column :memberships, :name
  end
end
