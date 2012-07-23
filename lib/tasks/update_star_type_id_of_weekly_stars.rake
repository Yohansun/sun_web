# -*- encoding : utf-8 -*-
desc "更新每周之星的star_type_id"	
task :update_star_type_id_of_weekly_stars => :environment  do
	WeeklyStar.find_each do |w|
		w.update_attribute :star_type_id, 1
	end
end