class AddFieldsForDesignImages < ActiveRecord::Migration
  def up
    add_column :design_images, :title, :string
    add_column :design_images, :last_user_id, :integer
    add_column :design_images, :last_updated_at, :datetime
    add_column :design_images, :audited, :boolean, default: false
  end

  def down
    remove_column :design_images, :title
    remove_column :design_images, :last_user_id
    remove_column :design_images, :last_updated_at
    remove_column :design_images, :audited, :boolean
  end
end
