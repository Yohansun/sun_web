class CreateCelebrities < ActiveRecord::Migration
  def change
    create_table :celebrities do |t|
      t.string :name,  null: false
      t.string :intro, default: ""
      t.references :celebrity_category
      t.timestamps
    end
    add_index :celebrities, :celebrity_category_id
  end
end
