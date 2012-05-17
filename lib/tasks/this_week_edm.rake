# -*- encoding : utf-8 -*-
desc "Send edm email to this week star"
task :this_week_edm => :environment  do
	user = User.find(3698)
	if user && user.username == "甜蜜蜜"
		Notifier.this_week(email).deliver
		puts "This week edm"
		puts "send status: ok"
	else
		puts "发送失败"
	end
end