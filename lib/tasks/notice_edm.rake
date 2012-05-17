# -*- encoding : utf-8 -*-
desc "Send edm email to this week star"
task :notice_edm => :environment  do
	u= User.find(3698)
	email = u.email
	if email && email != ''
		Notifier.notice(email).deliver
		puts '每周之星获奖者通知发送成功'
	else
		puts '每周之星获奖者通知发送失败'
	end
end