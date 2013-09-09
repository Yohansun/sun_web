#encoding: utf-8
class CreateIBanners < ActiveRecord::Migration
  def change
    create_table :i_banners do |t|
    	t.string :photo_name #图片标识
    	t.string :page_name #页面标识

    	t.integer :position #位置编号

    	t.string :class_name #页面分类区分（使用类名）
    	t.integer :i_banner_group_id

    	t.integer :image_width
    	t.integer :image_height

    	t.string :file_file_name
    	t.string :file_content_type
    	t.integer :file_file_size
    	t.datetime :file_updated_at

      t.timestamps
    end
  end
end
