# encoding: utf-8

# -*- encoding: utf-8 -*-
require 'spreadsheet'

desc "未来之星数据导入"
task :import_yda_image => :environment  do
  Spreadsheet.client_encoding ="UTF-8"
  book = Spreadsheet.open "#{Rails.root}/lib/data/yda_20130513.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    if row[0].present?
      user = User.find_by_username(row[0]) if row[0].present?
      sina_user = User.find_by_username("#{row[0]}") if row[0].present?
      new_user = nil
      if user && user.source == 'yda'
        new_user = user
      elsif sina_user
        new_user = sina_user
      else
        new_user = User.new
        new_user.username = "#{row[0]}" if row[0].present?
        new_user.password = "#{row[1]}"
        new_user.email = row[7]
        new_user.phone = row[8]
        new_user.name = row[9]
        new_user.current_school = row[10]
        new_user.types = '设计师'
        new_user.source = 'yda'
        new_user.role_id = 1
        new_user.des_status = 1
        new_user.save(validate: false)
      end
      area = Area.where("name like '%#{row[6].gsub(/市/,'')}%'").first if !row[3].blank?
      design = Design.new
      design.title = row[11]
      design.content = row[13]
      design.user_id = new_user.id
      design.area_id = area ? area.id : 31
      if design.save(validate: false)
        file_src_arr = Dir["/home/nioteam/icolor/yda/#{row[9]}/*"]
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
              design_image.title = row[11]
              design_image.area_id = area ? area.id : 31
              design_image.content = row[13]
              design_image.user_id = new_user.id
              design_image.source = 'yda'
              design_image.sorts = 6
              if design_image.save
                if row[12].present?
                  tag_arr = row[12].split(',')
                  tag_arr.each do |tag|
                    style = ImageLibraryCategory.where("title like ?",'%#{tag}%').first
                    ImageTag.create(image_library_category_id: style.id, design_image_id: design_image.id, genre: 'kepulande').first if style
                  end
                end
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
end