class CreateLoveStories < ActiveRecord::Migration
  def change
    create_table :love_stories do |t|
      t.text :content
      t.integer :user_id
      t.integer :area_id
      t.string :user_name
      t.string :come_from

      t.timestamps
    end
  end
end
