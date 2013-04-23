class RenameDistrictToDistrictIdInSites < ActiveRecord::Migration
  def change
  	rename_column :sites, :district, :district_id
  end

end
