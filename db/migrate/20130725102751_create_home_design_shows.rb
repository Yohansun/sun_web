#encoding: utf-8
class CreateHomeDesignShows < ActiveRecord::Migration
  def change
    create_table :home_design_shows do |t|
    	t.string :title
    	t.string :url
    	t.integer :vote
    	t.string :dimensions

    	t.integer :position # 0特指标题 1-4指图片(从左到右)
    	t.integer :design_type # 1设计之星 2作品展示 3色采配搭

    	t.string :file_file_name
    	t.string :file_content_type
    	t.integer :file_file_size
    	t.datetime :file_updated_at

      t.timestamps
    end
  end
end
