class AddColumnsMasterProfiles < ActiveRecord::Migration
  def change
    add_column :master_profiles, :mtype, :integer, default: 0
    add_column :master_profiles, :celebrity_content_board_id, :integer
    add_column :master_profiles, :avatar_file_name, :string
    add_column :master_profiles, :avatar_content_type, :string
    add_column :master_profiles, :avatar_file_size, :integer
    add_column :master_profiles, :avatar_updated_at, :datetime

    add_index :master_profiles, :mtype
    add_index :master_profiles, :celebrity_content_board_id
  end
end
