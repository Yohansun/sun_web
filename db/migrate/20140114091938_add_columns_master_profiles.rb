class AddColumnsMasterProfiles < ActiveRecord::Migration
  def change
    change_table(:master_profiles) do |t|
      t.integer :mtype, :default => 0, :comment => "0 master 1 celebrity 2 both"
      t.references :celebrity_content_board
    end
    add_index :master_profiles, :mtype
    add_index :master_profiles, :celebrity_content_board_id
  end
end
