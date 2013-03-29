# encoding: utf-8

# -*- encoding: utf-8 -*-
require 'spreadsheet'

desc "新浪图库数据导入"
task :import_image_libraries_sina => :environment  do
  Spreadsheet.client_encoding ="UTF-8"
  book = Spreadsheet.open "#{Rails.root}/lib/data/sina_20130325.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    if row[6].present?
      user = User.find_by_username(row[6]) if row[6].present?
      sina_user = User.find_by_username("#{row[6]}-sina") if row[6].present?
      new_user = nil
      if user && user.source == 'sina'
        new_user = user
      elsif sina_user
        new_user = sina_user
      else
        new_user = User.new
        new_user.username = "#{row[6]}"+"-sina" if row[6].present?
        new_user.password = '123456'
        new_user.types = '设计师'
        new_user.source = 'sina'
        new_user.role_id = 1
        new_user.des_status = 1
        new_user.save(validate: false)
      end
      style = ImageLibraryCategory.where("title like '%#{row[4]}%'").first if row[4].present?
      room = ImageLibraryCategory.where(title: row[5]).first  if row[5].present?
      area = Area.where("name like '%#{row[3].gsub(/市/,'')}%'").first if !row[3].blank?
      design = Design.new
      design.title = row[1]
      design.content = row[10]
      design.user_id = new_user.id
      design.style = style.title if style
      design.area_id = area ? area.id : 31
      design.room_type = room.title if room
      if design.save(validate: false)
        file_src_arr = Dir["/home/nioteam/icolor/sina/#{row[0].to_i}/*"]
        if file_src_arr.present?
          file_src_arr.each do |file_src|
            p '获取到图片！！！'
            p file_src
            after_poking = file_src.split('.').last
            if after_poking == 'jpg' || after_poking == 'JPG' || after_poking == 'jpeg' || after_poking == 'JPEG' 
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
              design_image.content = row[10]
              design_image.user_id = new_user.id
              design_image.source = 'sina'
              design_image.sorts = 4
              if design_image.save
                p "保存成功!"
              else
                p "保存失败!---#{row[0]}"
              end
            end
          end
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
  # files = ['kepulande_r1.xls', 'kepulande_r2.xls', 'kepulande_r3.xls', 'kepulande_r4.xls']
  # files.each do |xls_name|
    image_id = []
    book = Spreadsheet.open "#{Rails.root}/lib/data/kapulande_r8.xls"
    sheet1 = book.worksheet 0
    sheet1.each do |row|
      next if row[1] == '路径' || row[1].blank?
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
        new_user.types = '设计师'
        new_user.name_of_company = row[4] if row[4].present?
        new_user.email = row[8] if row[8].present?
        new_user.source = 'kepulande'
        new_user.role_id = 1
        new_user.des_status = 0
        new_user.save(validate: false)
      end
      #style = ImageLibraryCategory.where(title: row[6]).first
      # room = ImageLibraryCategory.where(title: row[5]).first
      area = Area.where("name like '%#{row[5].gsub(/市/,'')}%'").first if row[5].present?
      design = Design.new
      design.title = row[0]
      # design.content = row[13]
      design.user_id = new_user.id
      #design.style = style.title if style
      design.area_id = area ? area.id : 31
      # design.room_type = room.title if room
      if design.save(validate: false)
        # file_src_arr = Dir["/home/nioteam/icolor/lande/r4/#{row[1].gsub('\\', '/')}/*"]
        file_src_arr = Dir["/home/nioteam/icolor/kepulande/#{row[1]}/*"]
        # file_src_arr = Dir["/Users/sky/Downloads/kepulande/#{row[1]}/*"]
        unless file_src_arr.blank?
          file_src_arr.each do |file_src|
            p file_src
            after_poking = file_src.split('.').last
            if after_poking == 'jpg' || after_poking == 'JPG' || after_poking == 'jpeg' || after_poking == 'JPEG'
              design_image = design.design_images.new
              handle = open(file_src) rescue nil
              handle.class.class_eval { attr_accessor :original_filename, :content_type }
              handle.original_filename = file_src.split("/").last
              design_image.file = handle
              design_image.title = row[0]
              design_image.area_id = area ? area.id : 31
              #image_tag = ImageTag.where(image_library_category_id: style.id).first if style
              #design_image.tags = [image_tag] if image_tag.present?
              # design_image.room = room.id if room
              # design_image.content = row[13]
              design_image.user_id = new_user.id
              design_image.source = 'kepulande'
              if design_image.save
                if row[6].present?
                  tag_arr = row[6].split(',')
                  tag_arr.each do |tag|
                    style = ImageLibraryCategory.where("title like ?",'%#{tag}%').first
                    ImageTag.create(image_library_category_id: style.id, design_image_id: design_image.id).first if style
                  end
                end
                image_id << design_image.id
                p "保存成功!"
              end
            end
          end
        end
      end
    end
  # end
end

task :update_image_sort => :environment  do
  # DesignImage.all.each do |img|
  #   sorts = 100
  #   sorts = 1 if img.source == 'kepulande'
  #   sorts = 3 if img.imageable_type == 'MasterDesign'
  #   sorts = 4 if img.source == 'sina'
  #   sorts = 5 if img.imageable_type == 'ColorDesign'
  #   img.update_attribute(:sorts, sorts)
  # end
  WeeklyStar.all.each do |ws|
    design_id = ws.design_link.split('/').last
    if design = Design.find(design_id)
      design.design_images.each do |img|
         p "#{img.id}|#{img.update_attribute(:sorts, 2)}"
      end
    end
  end
end
