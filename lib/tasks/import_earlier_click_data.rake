# -*- encoding: utf-8 -*-
require "csv"

desc "修复外部硬广点击数据"
task :import_earlier_click_data => :environment  do

  p "Starting~~~~~~~~~~~~~~~~~"

  #p "Start Delete!!!!!"
  # date_array = ["2013-02-28".to_time(:local),"2013-03-01".to_time(:local),"2013-03-02".to_time(:local),"2013-03-03".to_time(:local),
  # "2013-03-04".to_time(:local),"2013-03-05".to_time(:local),"2013-03-06".to_time(:local),"2013-03-07".to_time(:local),"2013-03-08".to_time(:local),
  # "2013-03-09".to_time(:local),"2013-03-10".to_time(:local),"2013-03-11".to_time(:local),"2013-03-12".to_time(:local)]
  #date_array.each do |date|
  p "delete ALL HardSell !!!!"
  HardSell.delete_all
  #end

  p "Start Build!!!!!"
  time_array = []
  file_array = Dir.foreach("#{Rails.root}/public/system/relog_landing_log/").to_a
  file_array.delete("..")
  file_array.delete(".")
  file_array.each do |file|
    file_name = "#{Rails.root}/public/system/relog_landing_log/" + file
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
          case content
          when "80018shouyetupian2"
            hs.feature = "首页图片轮播"
            hs.site = "装修点评网"
          when "80018ketingpingdao2"
            hs.feature = "客厅频道"
            hs.site = "装修点评网"
          when "80018ketingpingdao2"
            hs.feature = "80018woshipingdao2"
            hs.site = "装修点评网"
          when "80018secaidapei2"
            hs.feature = "色彩搭配"
            hs.site = "装修点评网"
          when "a963shouyedingbu2","a963shouyejiaodian2","a963shouyedidiyiping2","a963shouyeredian2","a963shouyemingrenzhuanfang2"
            hs.feature = "首页"
            hs.site = "A963"
          when "a963shejishitongdao2"
            hs.feature = "设计师通道"
            hs.site = "A963"
          when "a963zixunzhongxinjiaodianxinwen2"
            hs.feature = "资讯中心"
            hs.site = "A963"
          when "a963edmhuiyuanyoujian2"
            hs.feature = "会员EDM"
            hs.site = "A963"
          when "pchousebankuaidingzhi2","pchousebankuaidingzhi-2"
            hs.feature = "版块定制"
            hs.site = "太平洋家居网"
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