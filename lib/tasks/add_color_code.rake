# -*- encoding: utf-8 -*-
desc "添加艺术漆"
task :add_color_code => :environment  do
  tmp = ["点睛蓝","点睛绿","仿古白","黑胡桃","黑色","红木色","红棕色","琥珀黄","原木色","棕色"]
  tmp.each do |t|
    color_code = ColorCode.find_by_code(t)
    unless color_code.present?
      ColorCode.create(code: t)
    end
  end
end