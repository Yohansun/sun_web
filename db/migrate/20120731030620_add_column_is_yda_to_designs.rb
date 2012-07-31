class AddColumnIsYdaToDesigns < ActiveRecord::Migration
  def change
  	add_column :designs, :is_yda, :boolean, :default => false
  end
end
