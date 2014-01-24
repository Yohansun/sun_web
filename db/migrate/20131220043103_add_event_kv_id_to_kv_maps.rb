class AddEventKvIdToKvMaps < ActiveRecord::Migration
  def change
    add_column :kv_maps, :event_kv_id, :integer
  end
end
