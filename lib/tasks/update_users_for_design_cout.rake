# -*- encoding : utf-8 -*-
desc "更新用户表，用户作品数"
namespace :icolor do
	
	task :update_user_recommend_designer_count => :environment  do
		User.all.each do |user|
			user.design_count = user.designs.count
			user.save!(:validate => false)
		end
	end
end
