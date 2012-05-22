# -*- encoding: UTF-8 -*-
desc "更新用户表上传作品数"
task :update_designs_count => :environment do
	User.find_each do |user|
		puts "starting.........."
		dcount = Design.where(:user_id => user.id).count
		user.designs_count = dcount
		user.save!(:validate => false)
		puts "updated %s " % user.id
	end
end