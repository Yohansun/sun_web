class CreateCelebrityContentBoards < ActiveRecord::Migration
  def change
    create_table :celebrity_content_boards do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
