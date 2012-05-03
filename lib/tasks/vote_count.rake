# -*- encoding : utf-8 -*-
desc "统计月份投票数"
task :votes_count => :environment  do
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

	users = User.find_by_sql("SELECT votes.id, votes.created_at,users.name, users.username, users.role_id, users.name_of_company, users.des_status, users.id, users.area_id FROM votes left outer join users on users.id = votes.user_id WHERE (votes.created_at BETWEEN '2012-04-01 00:00:00' AND '2012-04-30 23:59:59')")
	csv_string = CSV.open("#{Rails.root}/lib/data/votes_count.csv", "wb") do |csv|
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