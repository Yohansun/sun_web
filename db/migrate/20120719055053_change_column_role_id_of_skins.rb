class ChangeColumnRoleIdOfSkins < ActiveRecord::Migration
  def change
  	rename_column :skins, :role_id, :skin_type_id
  end
end
