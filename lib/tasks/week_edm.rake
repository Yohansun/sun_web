# -*- encoding : utf-8 -*-
desc "超过一周未登陆用户发送EDM"
task :week_edm => :environment  do
	users = User.where("last_sign_in_at IS NULL OR last_sign_in_at < '2012-05-10 0:0:0'")
	users.find_each do |u|
		email = u.email
		if email && email != ''
			Notifier.week(u).deliver
			puts '每周之星获奖者通知发送成功'
		else
			puts '每周之星获奖者通知发送失败'
		end
	end
end