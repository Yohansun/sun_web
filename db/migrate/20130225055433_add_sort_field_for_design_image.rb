class AddSortFieldForDesignImage < ActiveRecord::Migration
  def up
    add_column :design_images, :sorts, :integer, default: 100
  end

  def down
    remove_column :design_images, :sorts
  end
end
