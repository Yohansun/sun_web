class CreateHomeImageLibTags < ActiveRecord::Migration
  def change
    create_table :home_image_lib_tags do |t|
    	t.integer :category_id
    	t.string :childs_category

    	t.integer :rank

      t.timestamps
    end
  end
end
