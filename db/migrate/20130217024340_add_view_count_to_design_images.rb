class AddViewCountToDesignImages < ActiveRecord::Migration
  def change
    add_column :design_images, :view_count, :integer, :default => 0
  end
end
