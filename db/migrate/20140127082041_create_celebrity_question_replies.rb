class CreateCelebrityQuestionReplies < ActiveRecord::Migration
  def change
    create_table :celebrity_question_replies do |t|
      t.string :name
      t.text :content

      t.references :user
      t.references :celebrity_question
      t.timestamps
    end
    add_index :celebrity_question_replies, :user_id
    add_index :celebrity_question_replies, :celebrity_question_id
  end
end
