class AddFieldToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :future_star_active, :boolean, default: false
    add_column :designs, :story_id, :integer
    add_column :designs, :baicheng_active, :boolean, default: false
  end
end