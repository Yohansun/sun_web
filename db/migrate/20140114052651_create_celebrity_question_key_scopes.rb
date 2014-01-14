class CreateCelebrityQuestionKeyScopes < ActiveRecord::Migration
  def change
    create_table :celebrity_content_board_scopes do |t|
      t.string :name, null: false
      t.text   :key_arr

      t.references :celebrity_content_board
      t.timestamps
    end
    add_index :celebrity_content_board_scopes,:name
  end
end
