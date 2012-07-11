class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :gift_type
      t.string :gift_sub_type
      t.string :winner
      t.string :gift_name
      t.datetime :give_time
      t.datetime :published_at	
      t.integer :subject_id

      t.timestamps
    end
  end
end
