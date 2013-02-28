# encoding: utf-8

task :set_image_lib_tags_position => :environment  do
  %w(按户型 按空间 按面积 按风格 按调性 按费用 按色彩 按用途 按人群 按图片).each_with_index do |name, index|
    tag = ImageLibraryCategory.find_by_title(name)
    tag.position = index
    tag.save
  end
end