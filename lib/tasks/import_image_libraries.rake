# -*- encoding: utf-8 -*-
require 'spreadsheet'

desc "图库数据导入"
task :import_image_libraries => :environment  do
  Spreadsheet.client_encoding ="UTF-8"
  book = Spreadsheet.open "#{Rails.root}/lib/data/sina_20130109.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    new_user = User.new
    user = User.find_by_username(row[6])
    new_user.username = user ? "#{row[6]}"+"-sina" : row[6]
    new_user.password = '123456'
    new_user.types = row[7]
    new_user.source = 'sina'
    if new_user.save(validate: false)
      file_src_arr = Dir["/home/nioteam/icolor/sina/#{row[0]}/*"]
      unless file_src_arr.blank?
        file_src_arr.each do |file_src|
          design_image = DesignImage.new
          handle = open(file_src.src) rescue nil
          handle.class.class_eval { attr_accessor :original_filename, :content_type }
          handle.original_filename = file_src.split("/").last
          design_image.file = handle
          design_image.title = row[1]
          area = Area.where("name like '%#{row[3].gsub(/市/,'')}%'").first if !row[3].blank?
          design_image.area_id = area.id if area
          style = ImageLibraryCategory.where("title like '%#{row[4]}%'").first
          design_image.tags = [style.id] if style
          room = ImageLibraryCategory.where(title: row[5]).first
          design_image.room = room.id if room
          design_image.content = row[13]
          design_image.user_id = new_user.id
          design_image.source = 'sina'
          design_image.save  
        end    
      end
    end
  end

  # migartion designs table some fields to design_images
  designs = Design.all
  designs.each do |design|
    tags = []
    design.tags.each do |tag|
      img_lib_cats = ImageLibraryCategory.where("title like '%#{tag}%'")
      if img_lib_cats.present?
        img_lib_cats.each do |img_lib_cat|
          tags << img_lib_cat.id
        end
      end
    end
    styles = ImageLibraryCategory.where("title like '%#{design.style}%'")
    if styles.present?
      styles.each do |style|
        tags << style.id
      end
    end
    design.design_images.each do |design_img| 
      design_img.title = design.title
      design_img.content = design.content
      design_img.area_id = design.area_id
      design_img.color1 = design.recommend_color_category1
      design_img.tags = tags unless tags.blank?
      design_img.save
    end
  end
end