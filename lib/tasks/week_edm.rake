# -*- encoding : utf-8 -*-
desc "超过一周未登陆用户发送EDM"
task :week_edm => :environment  do
	users = User.where("last_sign_in_at IS NULL OR last_sign_in_at < '2012-05-10 0:0:0'")
	users.find_each do |u|
		unless u.email.blank?
			Notifier.week(u).deliver
			puts 'week send ok -- #{u.id}'
		else
			puts 'week send fail -- #{u.id}'
		end
	end
end