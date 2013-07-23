class CreateKvMaps < ActiveRecord::Migration
  def change
    create_table :kv_maps do |t|
      t.integer :home_kv_id
      t.string :url
      t.integer :width
      t.integer :high
      t.integer :x_line
      t.integer :y_line

      t.timestamps
    end
  end
end
