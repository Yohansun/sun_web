# -*- encoding: utf-8 -*-
require 'spreadsheet'
desc "导入获奖者"
task :add_winning => :environment  do
  Spreadsheet.client_encoding ="UTF-8"
  image_id = []
  book = Spreadsheet.open "#{Rails.root}/lib/data/winnings.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    winning = Winning.new
    winning.image_url = "/system/winnings/#{row[0]}"
    winning.url = row[1]
    winning.name = row[2]
    winning.area = row[3]
    winning.centent = row[4]
    winning.genre = row[5]
    if winning.save
      p "保存成功#{winning.name}"
    else
      p "保存失败#{winning.name}"
    end
  end
end

task :add_winning_image => :environment  do
  Spreadsheet.client_encoding ="UTF-8"
  image_id = []
  book = Spreadsheet.open "#{Rails.root}/lib/data/winning_image.xls"
  sheet1 = book.worksheet 0
  sheet1.each do |row|
    winning = Winning.find_by_name(row[0])
    if winning
      winning_image = WinningImages.new
      winning_image.image_url = "/system/winning_image/#{row[1]}"
      winning_image.winning_id = winning.id
      if winning_image.save
        p "保存成功#{winning_image.winning_id}"
      else
        p "保存失败#{winning_image.winning_id}"
      end
    end
  end
end

task :update_winning_image => :environment  do
  w = Winning.find_by_name("徐洁斌")
  w.winning_images.each do |wi|
    wi.destroy
  end
  (1..4).each do |i|
    winning_image = WinningImages.new
    winning_image.image_url = "/system/winning_image/xujiebin#{i}.jpg"
    winning_image.winning_id = w.id
    if winning_image.save
      p "保存成功#{winning_image.id}"
    else
      p "保存失败#{winning_image.id}"
    end
  end
end

task :update_winning_image2 => :environment  do
  w = Winning.find_by_name("徐结斌")
  (1..4).each do |i|
    winning_image = WinningImages.new
    winning_image.image_url = "/system/winning_image/xujiebin2#{i}.jpg"
    winning_image.winning_id = w.id
    if winning_image.save
      p "保存成功#{winning_image.id}"
    else
      p "保存失败#{winning_image.id}"
    end
  end
end

task :design_images_file_reprocess => :environment  do
  HomeType.all.each {|a| a.file.reprocess!}
  HomeStyle.all.each {|a| a.file.reprocess!}
  HomeCost.all.each {|a| a.file.reprocess!}
  HomeSpace.all.each {|a| a.file.reprocess!}
  HomeColor.all.each {|a| a.file.reprocess!}
end