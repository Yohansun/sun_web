class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :title
      t.string :url
      t.string :name
      t.string :style
      t.boolean :is_save, :default => false
      t.integer :votes_count, :default => 0
      t.integer :shares_count, :default => 0
      t.integer :comment_count, :default => 0
      t.integer :user_id
      t.boolean :top, :default => false
      t.boolean :choice, :default => false
      t.has_attached_file :img
      t.timestamps
    end
  end
end
