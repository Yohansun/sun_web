class AddAwardFlagForEventAttendee < ActiveRecord::Migration
  def up
    add_column :event_attendees, :award_mark, :string
  end

  def down
    remove_column :event_attendees, :award_mark
  end
end
