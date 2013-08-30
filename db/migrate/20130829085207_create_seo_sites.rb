class CreateSeoSites < ActiveRecord::Migration
  def change
    create_table :seo_sites do |t|
      t.string :title
      t.string :link
      t.integer :rank
      t.integer :genre
      t.timestamps
    end
  end
end
