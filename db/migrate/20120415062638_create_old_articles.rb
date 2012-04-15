class CreateOldArticles < ActiveRecord::Migration
  def change
    create_table :old_articles do |t|
      t.integer :class_id
      t.string :title
      t.string :image
      t.text :content
      t.datetime :publish_at
      t.integer :view_count
      t.string :thumb

      t.timestamps
    end
  end
end
