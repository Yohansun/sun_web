# -*- encoding: utf-8 -*-
desc "添加自定义图库链接数据SEO"
task :add_custom_metas_of_design_images => :environment  do
  tmp = []
  open("#{Rails.root}/lib/data/custom_design_images.csv").readlines.each do |line|
    line = line.strip
    row = line.split(";")
    tmp << row[1]
  end
  results = tmp.in_groups_of(4)

  results.each do |result|
    CustomMeta.create(fullpath: result[0],title: result[1],description: result[2],keywords: result[3])
    p result[1]
  end
end