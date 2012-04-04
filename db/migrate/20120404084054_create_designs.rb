class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :votes_count
      t.integer :shares_count
      t.integer :comments_count
      t.string :style
      t.string :room_type
      t.string :city

      t.timestamps
    end
  end
end
