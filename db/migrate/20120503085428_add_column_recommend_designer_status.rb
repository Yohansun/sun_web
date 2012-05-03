class AddColumnRecommendDesignerStatus < ActiveRecord::Migration
  def change
  	add_column :users, :recommend_designer_status, :integer, :default => 0
  end 
end