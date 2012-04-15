class AddColumnMessageToMasterProfiles < ActiveRecord::Migration
  def change
     add_column :master_profiles, :message, :text
  end
end
