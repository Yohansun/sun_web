class CreateCelebrityQuestionKeyScopes < ActiveRecord::Migration
  def change
    create_table :celebrity_question_key_scopes do |t|
      t.string :name
      t.text   :key_arr

      t.references :celebrity_content_board
      t.timestamps
    end
  end
end
