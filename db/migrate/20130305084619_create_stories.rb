class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.integer :area_id
      t.integer :user_id
      t.string :property_name

      t.timestamps
    end
  end
end
