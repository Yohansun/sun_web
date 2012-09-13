class AddColumnsToSellerData < ActiveRecord::Migration
  def change
  	add_column :seller_data, :product_top1_quantity, :integer, :default => 0
  	add_column :seller_data, :product_top2_quantity, :integer, :default => 0
  	add_column :seller_data, :product_top3_quantity, :integer, :default => 0
  	add_column :seller_data, :art_paint_quantity,    :integer, :default => 0
  	add_column :seller_data, :remarks, :text
  end
end