class AddViewCountToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :view_count, :integer, :default => 0
  end
end
