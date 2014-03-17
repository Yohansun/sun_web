class CreateEditorTreasuries < ActiveRecord::Migration
  def change
    create_table :editor_treasuries do |t|
      t.string :name, null: false
      t.text   :content
      t.text   :intro
      t.string :thumb_file_name
      t.string :thumb_content_type
      t.integer :thumb_file_size
      t.datetime :thumb_updated_at
      t.boolean :recommended, default: true, null: false

      t.references :celebrity_content_board
      t.timestamps
    end
    add_index :editor_treasuries, :recommended
    add_index :editor_treasuries, :celebrity_content_board_id
  end
end
