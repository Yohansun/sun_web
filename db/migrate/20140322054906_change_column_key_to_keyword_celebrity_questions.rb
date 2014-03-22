class ChangeColumnKeyToKeywordCelebrityQuestions < ActiveRecord::Migration
  def up
    remove_column :celebrity_questions, :key
    add_column :celebrity_questions, :keyword, :text
  end

  def down
    remove_column :celebrity_questions, :keyword
    add_column :celebrity_questions, :key, :string, null: false
  end
end
