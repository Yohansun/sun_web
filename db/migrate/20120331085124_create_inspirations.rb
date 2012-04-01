class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :votes_count, :default => 0
      t.integer :shares_count, :default => 0
      t.integer :comments_count, :default => 0
      t.has_attached_file :img

      t.timestamps
    end
  end
end
