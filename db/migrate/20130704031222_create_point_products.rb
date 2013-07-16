class CreatePointProducts < ActiveRecord::Migration
  def change
    create_table :point_products do |t|
    	t.string :product_type
    	t.string :product_name
    	t.string :product_point
    	t.boolean :flag, :default => true
    	t.integer :rank

      t.timestamps
    end

    add_index :point_products, :product_name
    add_index :point_products, :flag
  end
end
