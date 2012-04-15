class AddRecommendedToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :recommended, :boolean
  end
end
