class AddIndexToLands < ActiveRecord::Migration
  def change
  	add_index :lands, :source
  	add_index :lands, :created_at
  end
end