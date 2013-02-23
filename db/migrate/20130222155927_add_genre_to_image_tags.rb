class AddGenreToImageTags < ActiveRecord::Migration
  def change
  	add_column :image_tags, :genre, :string
  end
end
