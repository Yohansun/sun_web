class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :votes_count, :default => 0
      t.integer :shares_count, :default => 0
      t.integer :comments_count, :default => 0
      t.string :style
      t.string :room_type
      t.string :city

      t.timestamps
    end
  end
end