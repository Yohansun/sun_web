# -*- encoding: utf-8 -*-

desc "查询没有重新生成的图片"
task :check_design_image => :environment  do
  tmp = []
  count = 0
  file_arr1 = Dir["public/system/design_images/files/000/*"]
  file_arr1.each do |file|
    file_arr2 = Dir["#{file}/*"]
    file_arr2.each do |file2|
      if File.directory?("#{file2}/channel_image") == false
        arr = Dir["#{file2}/thumb/*"]
        path = arr[0].split('.').first
        id = path.split('/').last
        tmp << ["#{id}"]
        count += 1
      end
    end
  end
  if count > 0
    CSV.open("#{Rails.root}/lib/data/check_design_image.csv", 'wb') do |csv|
      tmp.each {|f| csv << [f]}
    end
  end
  p count
end
