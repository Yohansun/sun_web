# -*- encoding: utf-8 -*-
task :source_user_info_0620 => :environment  do
	SEX = { "女" => "0", "男" => "1"}
	open("#{Rails.root}/lib/data/users_0620.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first

		if row[2].match(%r(家装公司))
				u = User.new(
				:username => row[1], 
				:area_id => area.id || 0, 
				:role_id => 2,
				:location => row[3],
				:phone => row[4],
				:email => row[5],
				:password => "123456",
				:password_confirmation => "123456"
				)
			u.save!(:validate => false)
			puts "user======>>> %s" % u.id
		else
			u = User.new(
				:username => row[1], 
				:area_id => area.id || 0, 
				:role_id => 1,
				:des_status => 0,
				:inauguration_company => row[3],
				:phone => row[4],
				:email => row[5],
				:password => "123456",
				:password_confirmation => "123456"
				)
			u.save!(:validate => false)
			puts "user======>>> %s" % u.id
					
		end	

	end
end