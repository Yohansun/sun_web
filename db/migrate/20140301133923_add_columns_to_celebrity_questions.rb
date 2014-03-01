class AddColumnsToCelebrityQuestions < ActiveRecord::Migration
  def change
    add_column :celebrity_questions,:is_delete,:boolean,default: false
    add_column :celebrity_questions,:delete_at,:datetime
    add_column :celebrity_questions,:delete_media_id,:integer
  end
end
