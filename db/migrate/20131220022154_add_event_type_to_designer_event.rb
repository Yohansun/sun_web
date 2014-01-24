class AddEventTypeToDesignerEvent < ActiveRecord::Migration
  def change
    add_column :designer_events, :event_type, :string
  end
end
