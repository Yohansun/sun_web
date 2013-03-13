class AddAreaIdForBaichengEvent < ActiveRecord::Migration
  def up
    add_column :baicheng_events, :area_id, :integer
    add_index :baicheng_events, :area_id
  end

  def down
    remove_colum :baicheng_events, :area_id
    remove_index :baicheng_events, :area_id
  end
end
