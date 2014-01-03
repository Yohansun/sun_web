class CreateCelebrityCategories < ActiveRecord::Migration
  def change
    create_table :celebrity_categories do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
