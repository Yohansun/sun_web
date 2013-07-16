class CreatePointGifts < ActiveRecord::Migration
  def change
    create_table :point_gifts do |t|
    	t.string :gift_type
    	t.string :gift_name
    	t.integer :gift_point
    	t.boolean :flag, :default => true
    	t.integer :rank

      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end

    add_index :point_gifts, :gift_name
    add_index :point_gifts, :flag
  end
end
