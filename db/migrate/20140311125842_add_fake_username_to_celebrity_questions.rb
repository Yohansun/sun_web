class AddFakeUsernameToCelebrityQuestions < ActiveRecord::Migration
  def change
    add_column :celebrity_questions, :fake_username, :string
  end
end
