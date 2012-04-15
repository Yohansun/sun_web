class CreateOldDesignFiles < ActiveRecord::Migration
  def change
    create_table :old_design_files do |t|
      t.integer :old_design_id
      t.string :title
      t.string :src
      t.integer :index
      t.datetime :create_date
      t.integer :photo_type
      t.boolean :is_cover
      t.string :space

      t.timestamps
    end
  end
end
