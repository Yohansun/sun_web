class CreateCelebrityQuestions < ActiveRecord::Migration
  def change
    create_table :celebrity_questions do |t|
      t.string :name, null: false
      t.string :key, null: false
      t.text :content

      t.references :master_profile
      t.references :user
      t.references :celebrity_content_board
      t.timestamps
    end
    add_index :celebrity_questions, :user_id
    add_index :celebrity_questions, :master_profile_id
    add_index :celebrity_questions, :celebrity_content_board_id

  end
end
