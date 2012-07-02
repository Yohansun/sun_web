class CreateSellerData < ActiveRecord::Migration
  def change
    create_table :seller_data do |t|
    	t.integer :sales
    	t.string  :product_top1
    	t.string  :product_top2
    	t.string  :product_top3 

      #工具申请
      t.boolean :apply_for_tools, :default => false
      t.string  :tool_ids

    	t.integer :user_id

      t.timestamps
    end
  end
end