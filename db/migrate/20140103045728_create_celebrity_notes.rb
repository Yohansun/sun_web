class CreateCelebrityNotes < ActiveRecord::Migration
  def change
    create_table :celebrity_notes do |t|
      t.string :name, null: false
      t.text   :content

      t.references :celebrity
      t.timestamps
    end
    add_index :celebrity_notes, :celebrity_id
  end
end
