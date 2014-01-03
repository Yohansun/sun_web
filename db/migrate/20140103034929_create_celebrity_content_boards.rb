class CreateCelebrityContentBoards < ActiveRecord::Migration
  def change
    create_table :celebrity_content_boards do |t|
      t.string :name, null: false
      t.references :media
      t.timestamps
    end
    add_index :celebrity_content_boards, :media_id
  end
end
