class AddInspirationIdToCollects < ActiveRecord::Migration
  def change
  	add_column :collects, :inspiration_id, :integer
  end
end
