class ChangeUserIdInPeople < ActiveRecord::Migration
  def change
  	change_column :people, :user_id, :integer, :default => nil
  end

end
