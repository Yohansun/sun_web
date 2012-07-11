class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
    	t.integer :user_id
    	t.text :content
    	t.boolean :is_privacy, :default => false
    	t.string :color_code
    	t.integer :shares_count, :default => 0
      t.string :color_name
      t.string :font_color

      t.timestamps
    end

    add_index :moods, :user_id
  end
end
