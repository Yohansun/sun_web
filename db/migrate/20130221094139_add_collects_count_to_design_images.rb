class AddCollectsCountToDesignImages < ActiveRecord::Migration
  def change
    add_column :design_images, :collects_count, :integer, :default => 0
  end
end
