class AddColumnIsShowLayerToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_show_layer, :boolean, :default => true
  end
end