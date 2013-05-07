class AddCommentToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :comment_count, :integer
  end
end
