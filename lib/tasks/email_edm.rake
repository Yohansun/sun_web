# -*- encoding: utf-8 -*-
desc "注册设计师账号通知EDM"
task :email_edm => :environment  do

	CSV.foreach("#{Rails.root}/lib/data/zm_user.csv") do |row|
		name = row[1]
		email = row[3]

		if email =~ /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9-]+[\.a-zA-Z]+$/
  		puts "send to #{name} -- #{email}"
  	end
  	Notifier.email(email, name).deliver
  end
end
