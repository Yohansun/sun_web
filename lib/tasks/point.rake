# -*- encoding: utf-8 -*-

desc "create point gift image"
task :create_point_gift_image => :environment  do
  PointGift.all.each do |point_gift|
    point_gift.file = File.open("tmp.jpg")
    point_gift.save
  end
end