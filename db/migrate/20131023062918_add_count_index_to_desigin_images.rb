class AddCountIndexToDesiginImages < ActiveRecord::Migration
  def change
    add_index :design_images,
      [:created_at, :imageable_id, :imageable_type, :user_id, :edited_color, :audited],
      name: 'count_index'
  end
end
