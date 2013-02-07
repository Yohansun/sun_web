# -*- encoding: utf-8 -*-
require 'spreadsheet'

desc "新浪图库数据导入"
task :import_image_libraries_sina => :environment  do
  Spreadsheet.client_encoding ="UTF-8"
  book = Spreadsheet.open "#{Rails.root}/lib/data/sina_20130122.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    user = User.find_by_username(row[6])
    sina_user = User.find_by_username("#{row[6]}-sina")
    new_user = nil
    if user && user.source == 'sina'
      new_user = user
    elsif sina_user
      new_user = sina_user
    else
      new_user = User.new
      new_user.username = "#{row[6]}"+"-sina"
      new_user.password = '123456'
      new_user.types = row[7]
      new_user.source = 'sina'
      new_user.save(validate: false)
    end
    style = ImageLibraryCategory.where("title like '%#{row[4]}%'").first
    room = ImageLibraryCategory.where(title: row[5]).first
    area = Area.where("name like '%#{row[3].gsub(/市/,'')}%'").first if !row[3].blank?
    design = Design.new
    design.title = row[1]
    design.content = row[13]
    design.user_id = new_user.id
    design.style = style.title if style
    design.area_id = area ? area.id : 31
    design.room_type = room.title if room
    if design.save(validate: false)
      file_src_arr = Dir["/home/nioteam/icolor/sina/#{row[0].to_i}/*"]
      unless file_src_arr.blank?
        file_src_arr.each do |file_src|
          design_image = design.design_images.new
          handle = open(file_src) rescue nil
          handle.class.class_eval { attr_accessor :original_filename, :content_type }
          handle.original_filename = file_src.split("/").last
          design_image.file = handle
          design_image.title = row[1]
          design_image.area_id = area ? area.id : 31
          image_tag = ImageTag.where(image_library_category_id: style.id).first if style
          design_image.tags = [image_tag] if image_tag.present?
          design_image.room = room.id if room
          design_image.content = row[13]
          design_image.user_id = new_user.id
          design_image.source = 'sina'
          design_image.save  
          p "保存成功!"
        end    
      end
    end
  end

  # migartion designs table some fields to design_images
  # designs = Design.all
  # designs.each do |design|
  #   tags = []
  #   design.tags.each do |tag|
  #     img_lib_cats = ImageLibraryCategory.where("title like '%#{tag}%'")
  #     if img_lib_cats.present?
  #       img_lib_cats.each do |img_lib_cat|
  #         tags << ImageTag.new(image_library_category_id: img_lib_cat.id)
  #       end
  #     end
  #   end
  #   styles = ImageLibraryCategory.where("title like '%#{design.style}%'")
  #   if styles.present?
  #     styles.each do |style|
  #       tags << ImageTag.new(image_library_category_id: style.id)
  #     end
  #   end
  #   design.design_images.each do |design_img| 
  #     design_img.title = design.title
  #     design_img.content = design.content
  #     design_img.area_id = design.area_id
  #     design_img.color1 = design.recommend_color_category1
  #     design_img.tags = tags unless tags.blank?
  #     design_img.reason = design.reason
  #     design_img.save
  #   end
  # end
end


desc "科普兰德图库数据导入"
task :import_image_libraries_for_kepulande => :environment  do
  Spreadsheet.client_encoding = "UTF-8"
  files = ['kepulande_r1.xls', 'kepulande_r2.xls', 'kepulande_r3.xls', 'kepulande_r4.xls']
  files.each do |xls_name|
    book = Spreadsheet.open "#{Rails.root}/lib/data/#{xls_name}"
    sheet1 = book.worksheet 0
    sheet1.each do |row|
      next if row[1] == '路径'
      user = User.find_by_username(row[2])
      kpld_user = User.find_by_username("#{row[2]}-kepulande")
      new_user = nil
      if user && user.source == 'kepulande'
        new_user = user
      elsif kpld_user
        new_user = kpld_user
      else
        new_user = User.new
        new_user.username = "#{row[2]}-kepulande"
        new_user.password = '123456'
        new_user.types = row[3]
        new_user.name_of_company = row[4] if row[4].present?
        new_user.email = row[8] if row[8].present?
        new_user.source = 'kepulande'
        new_user.save(validate: false)
      end
      style = ImageLibraryCategory.where(title: row[6]).first
      # room = ImageLibraryCategory.where(title: row[5]).first
      area = Area.where("name like '%#{row[5].gsub(/市/,'')}%'").first if row[5].present?
      design = Design.new
      design.title = row[0]
      # design.content = row[13]
      design.user_id = new_user.id
      design.style = style.title if style
      design.area_id = area ? area.id : 31
      # design.room_type = room.title if room
      if design.save(validate: false)
        file_src_arr = Dir["/home/nioteam/icolor/kepulande/#{row[1]}/*"]
        unless file_src_arr.blank?
          file_src_arr.each do |file_src|
            design_image = design.design_images.new
            handle = open(file_src) rescue nil
            handle.class.class_eval { attr_accessor :original_filename, :content_type }
            handle.original_filename = file_src.split("/").last
            design_image.file = handle
            design_image.title = row[0]
            design_image.area_id = area ? area.id : 31
            image_tag = ImageTag.where(image_library_category_id: style.id).first if style
            design_image.tags = [image_tag] if image_tag.present?
            # design_image.room = room.id if room
            # design_image.content = row[13]
            design_image.user_id = new_user.id
            design_image.source = 'kepulande'
            design_image.save
            p "保存成功!"
          end
        end
      end
    end
  end
end