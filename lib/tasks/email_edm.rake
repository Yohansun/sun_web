# -*- encoding: utf-8 -*-
desc "注册设计师账号通知EDM"
task :email_edm => :environment  do

	CSV.foreach("#{Rails.root}/lib/data/reg_suc_email.csv") do |row|
		name = row[1]
		email = row[3]
  	puts "send to #{name} -- #{email}"
  	Notifier.email(email, name).deliver
  end
end
