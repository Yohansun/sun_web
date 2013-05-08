# -*- encoding: utf-8 -*-
require "csv"

desc "导入外部硬广点击数据"
task :import_click_data => :environment  do

  p "Starting~~~~~~~~~~~~~~~~~"
  time_array = []
  file_name = "#{Rails.root}/public/system/landing_log/" + "landing.log." + (Time.now - 1.day).strftime("%Y%m%d")
  if File.exist?(file_name)
    File.open(file_name, "r").each_line do |line|
      line_time = line.scan(/[0-9]{4}-[0-9]{2}-[0-9]{2}/)[0]
      line_content = line.scan(/\=[0-9a-z-_]+/)[0].to_s.gsub('=','')
      time_array << [line_time, line_content]
    end

    days = time_array.map{|t| t[0] }.uniq
    contents = time_array.map{|t| t[1] }.uniq
    value_count_time_hash = {}
    days.each do |time|
      value_count_hash = {}
      time_array.each do |t|
        value_count_hash[t[1]] = 0
      end
      time_array.each do |t|
        value_count_hash[t[1]] += 1 if t[0] == time
      end
      value_count_time_hash[time] = value_count_hash
      p value_count_time_hash.keys
    end

    days.each do |day|
      contents.each do |content|
        if content.present?
          hs = HardSell.new
          hs.link = 'http://www.icolor.com.cn/landing?source=' + content.to_s
          hs.date = day
          if value_count_time_hash[day][content] != 0
            hs.num = value_count_time_hash[day][content]
          else
            hs.num = 0
          end
          current_land = LandSource.find_by_code(content)
          if current_land.present?
            hs.feature = current_land.position
            hs.site = current_land.site
          else
            hs.feature = "其他版块"
            hs.site = "其他站点"
          end
          hs.save
          p "."
        end
      end
    end
    p "Finished"
  else
    p file_name + " File doesn't exist!"
  end
end