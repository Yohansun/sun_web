class CreatePointStores < ActiveRecord::Migration
  def change
    create_table :point_stores do |t|
    	t.string :store_no

    	t.integer :area_id

    	t.string :sale_area
    	t.string :sale_department
    	t.string :sale_city
    	t.string :sale_subsidiary
    	t.string :city_level

    	t.string :store_name
    	t.string :store_type
    	t.string :store_distribution

      t.timestamps
    end

    add_index :point_stores, :store_no
    add_index :point_stores, :area_id
  end
end
