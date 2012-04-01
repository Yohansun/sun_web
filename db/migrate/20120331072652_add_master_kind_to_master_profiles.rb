class AddMasterKindToMasterProfiles < ActiveRecord::Migration
  def change
    add_column :master_profiles, :master_kind, :string
  end
end
