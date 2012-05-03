# -*- encoding : utf-8 -*-
desc "初始化片区快查推荐设计师"
task :update_user_recommend_designer_status => :environment do

	i = 10
	[3798,3732,1787,3800,1118,3923,1734,78,1023].each do |id|
		user = User.find(id) 
		user.recommend_designer_status = i
		i -= 1
		user.save!(:validate => false)
	end	
end