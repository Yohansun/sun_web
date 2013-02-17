class CreateCollects < ActiveRecord::Migration
  def change
  	create_table :collects do |t|
      t.integer :user_id
      t.integer :design_image_id

      t.timestamps
    end
  end
end
