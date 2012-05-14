# -*- encoding : utf-8 -*-
desc "统计有上传作品用户"
task :user_design_count => :environment  do
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
	puts ENV["start"]
	puts ENV["end"]
	# start_time = Time.local(2012, 04, 30)
	# end_time 	 = Time.local(2012, 05, 06, 23, 59, 59)
	start_time = ENV["start"]
	end_time = ENV["end"]
	ds = Design.where("created_at" => start_time..end_time)
	csv_string = CSV.open("#{Rails.root}/lib/data/export_data/user_design_count_#{start_time}_#{end_time}.csv", "wb") do |csv|
		csv
		csv << [convert('用户名'), convert('用户性质'), convert('用户作品url'), convert('用户主页url'), convert("省"), convert("市"), convert("区")]
		ds.each do |design|
			puts "Design id is %s" % design.id
			csv << [convert(design.user.display_name), convert(design.user.role_chn_name), convert("http://www.icolor.com.cn/users/#{design.user.id}"), convert(design.user.city.try(:parent).try(:name)), convert(design.user.try(:city).try(:name)), convert(design.user.try(:area).try(:name))]
		end
	end
	puts "Enddddddddddd"
end