# -*- encoding : utf-8 -*-
# desc "统计注册用户"
# task :reg_user_count => :environment  do
# 	# start_time = Time.local(2012, 04, 30)
# 	# end_time = Time.local(2012, 05, 06, 23, 59, 59)
# 	start_time = Time.local(2012, 07, 9)    #ENV["start"]
# 	end_time = Time.local(2012, 07, 15, 23, 59, 59)   #ENV["end"]

# 	users = User.where("created_at" => start_time..end_time)
# 	csv_string = CSV.open("#{Rails.root}/lib/data/export_data/reg_user.csv", "wb") do |csv|
# 		csv << ['用户名', '用户性质', '用户主页url', "省", "市", "区", "minisite"]
# 		users.each do |user|
# 			puts "staring..."
# 			puts "No...... %s" % user.id
# 			csv << [user.display_name, user.role_chn_name, "http://www.icolor.com.cn/users/#{user.id}", user.city.try(:parent).try(:name), user.try(:city).try(:name), user.try(:area).try(:name), user.is_from_minisite]
# 			puts "Enddddddddddd"
# 		end
# 	end
# end


desc "统计注册用户"
task :reg_user_count => :environment  do
require 'csv'
# def str)
# require 'iconv'
# begin
# converter = Iconv.new("GB2312//IGNORE", "UTF-8")
# converter.iconv(str)
# rescue
# str
# end
# end 

start_time = Time.local(2012, 07, 9, 00, 00, 00)
end_time = Time.local(2012, 07, 15, 23, 59, 59)
# start_time = ENV["start"]
# end_time = ENV["end"]

users = User.where("created_at" => start_time..end_time)
csv_string = CSV.open("#{Rails.root}/lib/data/reg_user_#{start_time}_#{end_time}.csv", "wb") do |csv|
csv
csv << ['ID', '用户名','用户性质', '邮件地址','联系电话' ,'用户主页url', "省", "市", "区", "minisite",'注册时间']
users.each do |user|
puts "staring..."
puts "No...... %s" % user.id
csv << [ user.id,
user.display_name, 
user.role_chn_name,
user.email,
user.phone,
"http://www.icolor.com.cn/users/#{user.id}",
user.city.try(:parent).try(:name),
user.try(:city).try(:name), 
user.try(:area).try(:name),
user.is_from_minisite,
user.created_at.strftime("%Y-%m-%d %H:%M:%S")

]
puts "Enddddddddddd"
end
end
end