# -*- encoding: UTF-8 -*-
desc "删除作品,包含图片"
task :delete_design_with_img => :environment  do
  design = Design.find(107512)

  if design
    design.design_images.each {|img| img.destroy; p 'img_destroy!'}
    design.destroy
    p 'design_destroy!'
  end
end
