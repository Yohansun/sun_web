class CreateTagSorts < ActiveRecord::Migration
  def change
    create_table :tag_sorts do |t|
      t.string :category_id
      t.string :title
      t.integer :genre
      t.timestamps
    end
  end
end
