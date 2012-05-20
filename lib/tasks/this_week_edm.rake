# -*- encoding : utf-8 -*-
desc "Send edm email to this week star"
task :this_week_edm => :environment  do
	User.find_each do |u|
		unless u.email.blank?
			Notifier.this_week(u.email).deliver
			puts "#{u.id} send ok"
		else
			puts "#{u.id} send fail"
		end
	end
end