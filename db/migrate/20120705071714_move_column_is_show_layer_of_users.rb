class MoveColumnIsShowLayerOfUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :is_show_layer
  end	
end
