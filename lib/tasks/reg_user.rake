# -*- encoding : utf-8 -*-
desc "统计注册用户"
task :reg_user_count => :environment  do
	require 'csv'
	def convert(str)
		require 'iconv'
		begin
			converter = Iconv.new("GB2312//IGNORE", "UTF-8")
			converter.iconv(str)
		rescue
			str
		end
	end 

	# start_time = Time.local(2012, 04, 30)
	# end_time = Time.local(2012, 05, 06, 23, 59, 59)
	start_time = ENV["start"]
	end_time = ENV["end"]

	users = User.where("created_at" => start_time..end_time)
	csv_string = CSV.open("#{Rails.root}/lib/data/export_data/reg_user_#{start_time}_#{end_time}.csv", "wb") do |csv|
		csv
		csv << [convert('用户名'), convert('用户性质'), convert('用户主页url'), convert("省"), convert("市"), convert("区")]
		users.each do |user|
			puts "staring..."
			puts "No...... %s" % user.id
			csv << [convert(user.display_name), convert(user.role_chn_name), convert("http://www.icolor.com.cn/users/#{user.id}"), convert(user.city.try(:parent).try(:name)), convert(user.try(:city).try(:name)), convert(user.try(:area).try(:name))]
			puts "Enddddddddddd"
		end
	end
end