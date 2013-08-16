class CreateIBannerGroups < ActiveRecord::Migration
  def change
    create_table :i_banner_groups do |t|
    	t.string :name
    	
      t.timestamps
    end
  end
end
