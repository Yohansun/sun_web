class CreatePointExchanges < ActiveRecord::Migration
  def change
    create_table :point_exchanges do |t|
    	t.integer :area_id
    	t.datetime :buy_date
    	t.integer :point_store_id
    	t.integer :point_product_id
    	t.integer :amount
    	t.integer :total_point
    	t.boolean :status

        t.timestamps
    end

    add_index :point_exchanges, :area_id
    add_index :point_exchanges, :buy_date
    add_index :point_exchanges, :point_store_id
    add_index :point_exchanges, :point_product_id
    add_index :point_exchanges, :status
  end
end
