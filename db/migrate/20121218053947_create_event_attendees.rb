class CreateEventAttendees < ActiveRecord::Migration
  def change
    create_table :event_attendees do |t|
      t.integer :special_event_id
      t.integer :user_id
      t.string  :benediction, limit: 500
      t.timestamps
    end
    add_index :event_attendees, :special_event_id
    add_index :event_attendees, :user_id
  end
end
