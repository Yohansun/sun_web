class CreateSpecialEvents < ActiveRecord::Migration
  def change
    create_table :special_events do |t|
      t.string  :name
      t.integer :user_id
      t.datetime :start_at
      t.datetime :due_at
      t.bollean  :actived, default: false
      t.timestamps
    end
    add_index :special_events, :start_at
    add_index :special_events, :due_at
    add_index :special_events, :actived
  end
end
