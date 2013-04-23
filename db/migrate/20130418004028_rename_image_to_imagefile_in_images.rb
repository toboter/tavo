class RenameImageToImagefileInImages < ActiveRecord::Migration
  def change
  	rename_column :images, :image, :imagefile
  end

end
