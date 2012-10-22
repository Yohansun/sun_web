class AddIsRefreshToDesigns < ActiveRecord::Migration
  def change
  	add_column :designs, :is_refresh, :boolean, :default => false
  end
end