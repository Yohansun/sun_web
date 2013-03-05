# encoding: utf-8

desc "Fix image tags"
task :fix_image_tags1 => :environment do
  f = File.open("fullids.csv", "w+")
  open("tagids.csv").readlines.each do |line|
    line.strip!
    row = line.split(",")
    right_tag = ImageTag.find(row[0]).design_image_id
    f.write([row[0], row[1], right_tag].join(","))
    f.write("\n")
  end
  f.close
end

task :fix_image_tags => :environment do
  open("fullids.csv").readlines.each do |line|
    line.strip!
    row = line.split(",")
    tag = ImageTag.find(row[0])
    if tag.design_image_id.to_i == row[1].to_i
      tag.design_image_id = row[2].to_i
      tag.save
      p tag.id
    end
  end
end

task :import_other_design_images => :environment  do
  %w(ColorDesign).each do |model|
    model.constantize.find_each do |item|
      file_src_arr = [item.show_preview_img.path(:original)]
      if file_src_arr.present?
        file_src_arr.each do |file_src|
          design_image = DesignImage.new
          handle = open(file_src) rescue nil

          if handle
            handle.class.class_eval { attr_accessor :original_filename, :content_type }
            handle.original_filename = item.show_preview_img.try(:original_filename)
            design_image.file = handle
            design_image.title = item.design_name
            design_image.content =  item.design_thought
            design_image.user_id = 0
            style = item.design_style
            usage = item.design_usage
            color = item.design_color
            style_ids = ImageLibraryCategory.where("title like '%#{style}%' or title like '%#{usage}%' or title like '%#{color}%' ").map(&:id).join(',')
            image_tags = ImageTag.where(" image_library_category_id in (#{style_ids})")
            design_image.tags =image_tags if image_tags.present?
            design_image.imageable_id = item.id
            design_image.imageable_type = model
            if design_image.save
              p "#{item.id}保存成功!"
            else
              p "保存失败!---#{row[0]}"
            end
          end
        end
      end
    end
  end
end

task :import_master_design_uploads => :environment  do
  %w(MasterDesignUpload).each do |model|
    model.constantize.find_each do |item|
      file_src_arr = [item.file.path(:original)]
      if file_src_arr.present?
        file_src_arr.each do |file_src|
          design_image = DesignImage.new
          handle = open(file_src) rescue nil
          p file_src
          p handle
          if handle
            handle.class.class_eval { attr_accessor :original_filename, :content_type }
            handle.original_filename = item.file.try(:original_filename)
            design_image.file = handle

            design_image.title = item.master_design.design_name
            design_image.content =  item.master_design.design_intro
            design_image.user_id = 0
            # style = item.design_style
            # usage = item.design_usage
            # color = item.design_color
            # style_ids = ImageLibraryCategory.where("title like '%#{style}%' or title like '%#{usage}%' or title like '%#{color}%' ").map(&:id).join(',')
            # image_tags = ImageTag.where(" image_library_category_id in (#{style_ids})")
            # design_image.tags =image_tags if image_tags.present?
            design_image.imageable_id = item.id
            design_image.imageable_type = model
            if design_image.save
              p "#{item.id}保存成功!"
            else
              p "保存失败!---#{row[0]}"
            end
          end
        end
      end
    end
  end
end
