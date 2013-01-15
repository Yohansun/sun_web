# -*- encoding: utf-8 -*-
require "csv"

desc "导出外部硬广点击数据"
task :export_click_data => :environment  do
  
  p "Starting~~~~~~~~~~~~~~~~~"
	time_array = []
	file = File.open("/Users/mac/landing.log.20130112", "r").each_line do |line|
		line_time = line.scan(/[0-9]{4}-[0-9]{2}-[0-9]{2}/)[0]
		line_content = line.scan(/\=[0-9a-z-]+/)[0].gsub('=','')
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
  end

  CSV.open("#{Rails.root}/public/#{Time.now.strftime("%Y-%m-%d")}-外部硬广数据导出.csv", "wb") do |csv|
    header = [nil, days].flatten
    csv << header
    value_count_time_hash.count.times do
      contents.each do |content|
        trunk = [content]
        days.each do |day|
          p day
          if value_count_time_hash[day][content] != 0
            trunk << value_count_time_hash[day][content]
          else
            trunk << 0
          end
        end
        csv << trunk
      end
    end  
  end

  p "Finished"
end