# -*- encoding : utf-8 -*-
desc "Send rebuild edm email to all users"
task :rebuild_edm => :environment  do
	User.find_each do |u|
		email = u.email
		if email && email != ''
			Notifier.rebuild(u).deliver
			puts 'send to ' + u.id.to_s
		else
			puts 'cant send to ' + u.id.to_s
		end
	end
end