# -*- encoding: utf-8 -*-
desc "新增义乌市到浙江省,并修改义乌归属"
task :update_new_areas0408 => :environment  do
	puts "start>>>>>>>>>>>>>>>>>>>>"
	a = Area.new
	a.name = '义乌市'
	a.parent_id = 184
	a.children_count = 1
	a.pinyin = 'yws'
	if a.save
		puts "SAVE!>>>>>>>>>>>>>>>>>>"

		puts "update_义乌市_parent_id>>>>>>>>>>>>>>>"
		b = Area.find(273)
		b.parent_id = a.id
		b.save
	else
		puts "faild<<<<<<<<<<<<<<<<<#{a.errors.full_messages}"
	end
end

desc "整合所有市级别名称后缀为市"
task :update_city_name0408 => :environment do
	ids = Area.roots.map(&:id)[2..-1]
	cities = Area.where(parent_id: ids)

	puts "start>>>>>update_city_name>>>>>>>>>>>>>"

	cities.each do |c|
		a = c.name + "A"
		b = a.split('市')
		#puts ">>>>>>>>>>>>>>>#{c.name}"
		if b.count > 1
			b = b.join('市')
			b = b.delete('A')
			c.name = b
			#c.save
			puts ">>>>>#{c.id}>>>>>RE>>#{c.name}"
		else
			b = b.join('市')
			b = b.delete('A')
			b = b + "市"
			c.name = b
			#c.save
			puts ">>>>>>>>>>RE#{c.id}>>#{c.name}"
		end
	end
end








