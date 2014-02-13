class AddMediaIdCelebrityQuestionReplies < ActiveRecord::Migration
  def change
    add_column :celebrity_question_replies, :media_id, :integer
  end
end
