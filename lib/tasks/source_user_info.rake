# -*- encoding: utf-8 -*-
desc "导入2012家装公司用户信息"
task :source_user_info => :environment  do
	SEX = { "女" => "0", "男" => "1"}
	#####beijing#####
	open("#{Rails.root}/lib/data/2012_icolor_user/beijing.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first
		u = User.new(
			:username => row[2], 
			:area_id => area.id || 0, 
			:name_of_company => row[1],
			:sex => SEX[row[3]],
			:role_id => 1,
			:des_status => 0,
			:phone => row[4],
			:email => row[6],
			:password => "123456",
			:password_confirmation => "123456"
			)
		u.save!(:validate => false)
		puts "user======>>> %s" % u.id
	end

	#####guangzhou#####
	open("#{Rails.root}/lib/data/2012_icolor_user/guangzhou.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first
		u = User.new(
			:username => row[1], 
			:area_id => area.id || 0,
			:role_id => 1,
			:des_status => 0,
			:phone => row[3],
			:email => row[2],
			:qq => row[4],
			:password => "123456",
			:password_confirmation => "123456"
			)
		puts "user======>>> %s" % u.id
	end

	#######haikou####
	open("#{Rails.root}/lib/data/2012_icolor_user/haikou.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first
		u = User.new(
			:username => row[2], 
			:area_id => area.id || 0,
			:name_of_company => row[1],
			:role_id => 1,
			:des_status => 0,
			:sex => SEX[row[3]],
			:phone => row[4],
			:email => row[5],
			:password => "123456",
			:password_confirmation => "123456"
			)
		u.save!(:validate => false)
		puts "user======>>> %s" % u.id
	end

	open("#{Rails.root}/lib/data/2012_icolor_user/shanghai.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first
		u = User.new(
			:username => row[2],
			:area_id => area.id || 0,
			:name_of_company => row[1],
			:role_id => 1,
			:des_status => 0,
			:phone => row[4],
			:email => row[5],
			:password => "123456",
			:password_confirmation => "123456"
			)
		u.save!(:validate => false)
		puts "user======>>> %s" % u.id
	end

	#####shenyang####
	open("#{Rails.root}/lib/data/2012_icolor_user/shenyang.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first
		u = User.new(
			:username => row[2],
			:area_id => area.try(:id) || 0,
			:role_id => 1,
			:des_status => 0,
			:name_of_company => row[1],
			:phone => row[4],
			:email => row[6],
			:sex => SEX[row[3]],
			:password => "123456",
			:password_confirmation => "123456"
			)
		u.save!(:validate => false)
		puts "user======>>> %s" % u.id
	end

	######wuhan####
	open("#{Rails.root}/lib/data/2012_icolor_user/wuhan.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first
		u = User.new(
			:username => row[2], 
			:area_id => area.id || 0,
			:role_id => 1,
			:des_status => 0,
			:name_of_company => row[1],
			:sex => SEX[row[3]],
			:phone => row[4],
			:email => row[5],
			:password => "123456",
			:password_confirmation => "123456"
			)
		u.save!(:validate => false)
		puts "user======>>> %s" % u.id
	end

	#####xian####
	open("#{Rails.root}/lib/data/2012_icolor_user/xian.csv").readlines.each do |line|
		row = line.split(",")
		puts "starting................"
		area = Area.find_by_sql("select * from areas where name like '%#{row[0]}%' and parent_id is not null").first
		u = User.new(
			:username => row[2], 
			:area_id => area.id || 0 ,
			:role_id => 1,
			:des_status => 0,
			:name_of_company => row[1],
			:phone => row[3],
			:email => row[4],
			:password => "123456",
			:password_confirmation => "123456"
			)
		u.save!(:validate => false)
		puts "user======>>> %s" % u.id
	end


end