# -*- encoding: utf-8 -*-

desc "按规则导出网站图片id"
task :check_design_image_id => :environment  do
  tmp = []
  #title is null or title  not like '%[^0-9]%' or
  @design_images = DesignImage.from.available.audited_with_colors.where("title like '%sina%' or length(title) < 4 or title is null or title like '%^[0-9]*$%'")
  @design_images.each do |design_image|
    tmp << "#{design_image.title} #{design_image.id}"
  end
  CSV.open("#{Rails.root}/lib/data/check_design_image_id.csv", 'wb') do |csv|
    tmp.each {|f| csv << [f]}
  end
end