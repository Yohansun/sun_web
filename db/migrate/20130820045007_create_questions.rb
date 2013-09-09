class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :link
      t.integer :rank
      t.integer :admin_id
      t.timestamps
    end
  end
end
