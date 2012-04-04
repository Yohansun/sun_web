class CreateDesignImages < ActiveRecord::Migration
  def change
    create_table :design_images do |t|
      t.integer :user_id
      t.integer :imageable_id
      t.string :imageable_type
      t.boolean :is_cover
      t.timestamps
    end
  end
end
