class AddImageIdForEventAttendee < ActiveRecord::Migration
  def up
    add_column :event_attendees, :design_image_id, :integer
  end

  def down
    remove_column :event_attendees, :design_image_id
  end
end
