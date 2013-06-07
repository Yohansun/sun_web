# encoding: utf-8
desc "更新无效邮箱判断"
task :update_invalid_email => :environment do
	tmp=[]

	open("#{Rails.root}/lib/data/invalid_email.csv").readlines.each do |line|
		row = line.split(",")
		
		email = row[0] ? row[0].strip.force_encoding("UTF-8") : nil

		user = User.find_by_email(email)
		
		if user.present?
			user.invalid_email = true
			user.save
			puts ">>>>>>>>>>>>>>>>>Start_update!>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
		else
			tmp << [row[0]]
			puts ">>>>>>>>>>>>#{email}>>>>>不存在>>>>>>>>>>>>>>>>>>>>啊>>>>>>>>>>>"
		end
	end

	CSV.open("#{Rails.root}/lib/data/undefind_email0607.csv", 'wb') do |csv|
		tmp.each {|f| csv << f}
	end
end