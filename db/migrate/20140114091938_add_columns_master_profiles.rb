class AddColumnsMasterProfiles < ActiveRecord::Migration
  def change
    add_column :master_profiles, :mtype, :integer, default: 0
    add_column :master_profiles, :celebrity_content_board_id, :integer
    add_index :master_profiles, :mtype
    add_index :master_profiles, :celebrity_content_board_id
  end
end
