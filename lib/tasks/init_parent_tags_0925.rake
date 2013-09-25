# -*- encoding : utf-8 -*-
desc "初始全部筛选标签"
task :init_parent_tags => :environment  do
  aa = [1,366,82, 28, 34, 62, 19, 107, 122, 127, 132, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224]
  n = 0

  aa.each do |parent_id|
    ParentTag.transaction do
      child_ids = ImageLibraryCategory.find(parent_id).children.map(&:id)
      ImageTag.where(image_library_category_id: child_ids).select("DISTINCT design_image_id").each do |image|
        next if image.design_image_id.blank? || image.design_image_id < 1
        tag = ParentTag.new(design_image_id: image.design_image_id, image_library_category_id: parent_id)
        tag.save(validate: false)
        n += 1
        p n
      end
    end
  end
end