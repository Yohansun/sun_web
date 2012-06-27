# -*- encoding: utf-8 -*-
desc "导入2012家装公司用户信息"
task :source_user_infom => :environment  do
	tmp = []
	CSV.open("xznjresult.csv", 'wb') do |csv|
		CSV.foreach("#{Rails.root}/lib/data/2012_icolor_user/xuzhou_nanjing.csv") do |row|
			puts "starting................"
			
			if row[2] == "设计师"
				role_id = 1
			else
				role_id = 2
			end

			user = User.where("email like '%#{row[5]}%' OR phone like '%#{row[4]}%'").first
			    
			unless user
				area = Area.find_by_name(row[0])
				u = User.new(
					:username => row[5], #邮箱作为用户名
					:name_of_company => row[3],
					:role_id => role_id,
					:phone => row[4],
					:email => row[5],
					:password => "123456",
					:password_confirmation => "123456",
					:area_id => area.id,
					:is_read => true
				)
		    
		    unless u.save
		    	tmp << row[1]
		    	puts "#{u.errors.inspect}"
		    else
		    	puts "user======>>> %s" % u.id
			    u.reset_password_token = User.reset_password_token
			    u.save(:validate => false)
			    csv << [u.email, u.name, u.reset_password_token]
		    end
		  else
		  	tmp << "#{row[4]} -- #{row[5]}"
		  end
		end
	end

	CSV.open("failed_tasks.csv", 'wb') do |csv|
		tmp.each {|f| csv << [f]}
	end
end