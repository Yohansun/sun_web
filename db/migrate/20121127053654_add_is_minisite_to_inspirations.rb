class AddIsMinisiteToInspirations < ActiveRecord::Migration
  def change
    add_column :inspirations, :is_minisite, :boolean, :default => false
  end
end
