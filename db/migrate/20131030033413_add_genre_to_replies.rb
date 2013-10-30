class AddGenreToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :genre, :string
  end
end