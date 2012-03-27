class ChangeColumnCountryOfMasterProfiles < ActiveRecord::Migration
  def change
    rename_column :master_profiles, :country, :nationality
  end
end
