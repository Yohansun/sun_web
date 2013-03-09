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

desc "Fix missing image tags"
task :fix_missing_tags => :environment do
  total_missing = []
  open("update_tags.log").readlines.each do |line|
    line.strip!
    data = line.split("Parameters: ").last
    hash = eval(data)
    tags = hash["tags"].map { |e| e.to_i }
    design_image_id = hash["image_library_id"].to_i
    current_tags = ImageTag.where(:design_image_id => design_image_id).all.map { |e| e.image_library_category_id }
    if tags != current_tags
      p design_image_id
      # p tags
      # p current_tags
      missing_tags = (tags - current_tags)
      p missing_tags
      total_missing << missing_tags

      missing_tags.each do |tag_id|
        ImageTag.create(design_image_id: design_image_id, image_library_category_id: tag_id)
      end
    end
  end
  p total_missing.flatten.size
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

task :import_master_design => :environment  do
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

            design_image.title = item.master_design.design_name if item.master_design.design_name
            design_image.content =  item.master_design.design_intro
            design_image.user_id = 0
            # style = item.design_style
            # usage = item.design_usage
            # color = item.design_color
            # style_ids = ImageLibraryCategory.where("title like '%#{style}%' or title like '%#{usage}%' or title like '%#{color}%' ").map(&:id).join(',')
            # image_tags = ImageTag.where(" image_library_category_id in (#{style_ids})")
            # design_image.tags =image_tags if image_tags.present?
            design_image.imageable_id = item.master_design_id
            design_image.imageable_type = model
            if design_image.save
              p "#{item.id}保存成功!"
              p "imageable_id:        #{item.master_design_id}"
            else
              p "保存失败!---#{row[0]}"
            end
          end
        end
      end
    end
  end
end
task :import_master_design_upload_to_master_design => :environment do
  @images = DesignImage.where("design_images.imageable_type = 'MasterDesignUpload' ")
  @images.each do |image|
    @design = MasterDesignUpload.find(image.imageable_id)
    imageable_id = @design.master_design_id
    if image.imageable_type && image.imageable_id
      image.update_attributes!(imageable_type: "MasterDesign", imageable_id: imageable_id)
      p"#{image.id} save success!"
    else
      p"failed "
    end
  end
end
