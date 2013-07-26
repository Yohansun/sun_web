class CreateHomeImageLibTags < ActiveRecord::Migration
  def change
    create_table :home_image_lib_tags do |t|
    	t.integer :category_id
    	t.string :category_list

    	t.integer :rank, default: 0

      t.timestamps
    end
  end
end
