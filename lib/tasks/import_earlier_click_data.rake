# -*- encoding: utf-8 -*-
require "csv"

desc "修复外部硬广点击数据"
task :import_earlier_click_data => :environment  do

  p "Starting~~~~~~~~~~~~~~~~~"

  p "Start Delete!!!!!"

  # 重做全部数据
  # date_array.each do |date|
  #   p "delete ALL HardSell !!!!"
  #   HardSell.delete_all
  # end
  # file_array = Dir.foreach("#{Rails.root}/public/system/relog_landing_log/").to_a
  # file_array.delete("..")
  # file_array.delete(".")

  # 重做几天的数据
  date_array = ["2013-04-25".to_time(:local),
                "2013-04-26".to_time(:local),
                "2013-04-27".to_time(:local),
                "2013-04-28".to_time(:local),
                "2013-04-29".to_time(:local),
                "2013-04-30".to_time(:local),
                "2013-05-01".to_time(:local),
                "2013-05-02".to_time(:local),
                "2013-05-03".to_time(:local),
                "2013-05-04".to_time(:local),
                "2013-05-05".to_time(:local),
                "2013-05-06".to_time(:local),
                "2013-05-07".to_time(:local),
                "2013-05-08".to_time(:local)]

  date_array.each do |date|
    p "delete #{date} HardSell"
    HardSell.where(date: date).delete_all
  end

  p "Start Build!!!!!"
  file_array = ["landing.log.20130425",
                "landing.log.20130426",
                "landing.log.20130427",
                "landing.log.20130428",
                "landing.log.20130429",
                "landing.log.20130430",
                "landing.log.20130501",
                "landing.log.20130502",
                "landing.log.20130503",
                "landing.log.20130504",
                "landing.log.20130505",
                "landing.log.20130506",
                "landing.log.20130507"]
  file_array.each do |file|
    file_name = "#{Rails.root}/public/system/landing_log/" + file
    time_array = []
    days = []
    contents = []

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
      p "Finished"
    else
      p file_name + " File doesn't exist!"
    end
  end
end