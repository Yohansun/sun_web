# -*- encoding: utf-8 -*-
desc "注册设计师账号通知EDM"
task :email_edm => :environment  do

	#####beijing#####
	open("#{Rails.root}/lib/data/2012_icolor_user/beijing.csv").readlines.each do |line|
		row = line.split(",")
		send_email(row[2])
	end

	#####guangzhou#####
	open("#{Rails.root}/lib/data/2012_icolor_user/guangzhou.csv").readlines.each do |line|
		row = line.split(",")
		send_email(row[1])
	end

	#######haikou####
	open("#{Rails.root}/lib/data/2012_icolor_user/haikou.csv").readlines.each do |line|
		row = line.split(",")
		send_email(row[2])
	end

	open("#{Rails.root}/lib/data/2012_icolor_user/shanghai.csv").readlines.each do |line|
		row = line.split(",")
		send_email(row[2])
	end

	#####shenyang####
	open("#{Rails.root}/lib/data/2012_icolor_user/shenyang.csv").readlines.each do |line|
		row = line.split(",")
		send_email(row[2])
	end

	######wuhan####
	open("#{Rails.root}/lib/data/2012_icolor_user/wuhan.csv").readlines.each do |line|
		row = line.split(",")
		send_email(row[2])
	end

	#####xian####
	open("#{Rails.root}/lib/data/2012_icolor_user/xian.csv").readlines.each do |line|
		row = line.split(",")
		send_email(row[2])
	end
end

def send_email(username)
	puts "starting................"
	user = User.find_by_username(username) || User.new
	email = user.email
	if email && email != ''
		Notifier.email(user).deliver
		puts 'OK'
	else
		puts 'Fail'
	end
	puts "user:#{username}======>>> %s" % (user.id || 0)
end
