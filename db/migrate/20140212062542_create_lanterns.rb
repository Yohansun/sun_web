class CreateLanterns < ActiveRecord::Migration
  def change
    create_table :lanterns do |t|
      t.integer :user_id
      t.string :content
      t.integer :forwar
      t.integer :date_at
      t.timestamps
    end
  end
end
