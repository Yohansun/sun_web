class CreateCelebrityNotes < ActiveRecord::Migration
  def change
    create_table :celebrity_notes do |t|
      t.string :name, null: false
      t.text   :content
      t.string :thumb, default: "", null: false
      t.boolean :recommended, default: true, null: false

      t.references :master_profile
      t.references :celebrity_content_board
      t.timestamps
    end
    add_index :celebrity_notes, :recommended
    add_index :celebrity_notes, :master_profile_id
    add_index :celebrity_notes, :celebrity_content_board_id
  end
end
