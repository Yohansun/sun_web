class CreateHxKvs < ActiveRecord::Migration
  def change
    create_table :hx_kvs do |t|
      t.string :url
      t.integer :position
      t.string :file_file_name
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at

      t.timestamps
    end
    create_table :hx_maps do |d|
      d.integer :hx_kv_id
      d.string :url
      d.integer :width
      d.integer :high
      d.integer :x_line
      d.integer :y_line

      d.timestamps
    end

    add_index :hx_kvs, :position
    add_index :hx_kvs, :created_at
    add_index :hx_kvs, :updated_at

    add_index :hx_maps, :hx_kv_id
    add_index :hx_maps, :created_at
    add_index :hx_maps, :updated_at
  end
end
