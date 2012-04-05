class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.has_attached_file :event_img
      t.date :begin_at
      t.date :end_at
      t.string :begin_time
      t.string :end_time
      t.text :description
      t.integer :sponsor_id
      t.timestamps
    end
  end
end
