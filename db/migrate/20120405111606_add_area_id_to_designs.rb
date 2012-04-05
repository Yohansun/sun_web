class AddAreaIdToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :area_id, :integer
    add_column :users, :area_id, :integer
  end
end
