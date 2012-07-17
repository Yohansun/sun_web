class CreateSkinKvUploads < ActiveRecord::Migration
  def change
    create_table :skin_kv_uploads do |t|
    	t.string  :kv_link
    	t.string  :link_coords
    	t.integer :skin_id

      t.timestamps
    end
  end
end
