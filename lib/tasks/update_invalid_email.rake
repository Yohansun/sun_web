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

desc "导出icolor正常注册邮箱发送EDM"
task :export_all_users_0929 => :environment do
  tmp = []
  n = 0
  users = User.where("email IS NOT NULL AND email <> '' AND invalid_email = 0")

  users.find_each do |user|
    if user.email =~ /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9-]+[\.a-zA-Z]+$/
      n += 1
      p n
      tmp << [user.display_name,user.email]
    end
  end

  CSV.open("#{Rails.root}/lib/data/export_all_users_0929.csv", 'wb') do |csv|
    tmp.each {|f| csv << f}
  end
end