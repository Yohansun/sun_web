# -*- encoding : utf-8 -*-
desc "统计注册用户"
task :reg_user_count => :environment  do
	require 'csv'
	def convert(str)
		require 'iconv'
		begin
			converter = Iconv.new("GB2312", "UTF-8")
			converter.iconv(str)
		rescue
			str
		end
	end 

	start_time = Time.local(2012, 04, 01)
	end_time 	 = start_time.at_end_of_month
	users = User.where("created_at" => start_time..end_time)
	csv_string = CSV.open("#{Rails.root}/lib/data/reg_user.csv", "wb") do |csv|
		csv
		csv << [convert('用户名'), convert('用户性质'), convert('用户主页url'), convert("省"), convert("市"), convert("区")]
		users.each do |user|
			puts "staring..."
			puts "No...... %s" % user.id
			csv << [convert(user.display_name), convert(user.role_chn_name), convert("http://icolor.com.cn/#{user.id}"), convert(user.city.try(:parent).try(:name)), convert(user.try(:city).try(:name)), convert(user.try(:area).try(:name))]
			puts "Enddddddddddd"
		end
	end
end