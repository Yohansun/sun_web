class CreateEditorTreasuries < ActiveRecord::Migration
  def change
    create_table :editor_treasuries do |t|
      t.string :name, null: false
      t.text   :content
      t.string :thumb, default: "", null: false
      t.boolean :recommended, default: true, null: false

      t.references :celebrity_content_board
      t.timestamps
    end
    add_index :editor_treasuries, :recommended
    add_index :editor_treasuries, :celebrity_content_board_id
  end
end
