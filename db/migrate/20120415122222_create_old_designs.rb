class CreateOldDesigns < ActiveRecord::Migration
  def change
    create_table :old_designs do |t|
      t.string :title
      t.integer :user_id
      t.integer :month
      t.integer :year
      t.integer :top_n
      t.string :tags
      t.datetime :create_date
      t.integer :view_count
      t.boolean :recommended
      t.boolean :month_star
      t.string :style

      t.timestamps
    end
  end
end
