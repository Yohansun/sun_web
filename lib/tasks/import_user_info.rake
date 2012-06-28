# -*- encoding: utf-8 -*-
desc "导入南京郑州设计师公司用户"
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

			email = row[5] ? row[5].force_encoding("UTF-8") : nil
			username = row[1] ? row[1].force_encoding("UTF-8") : nil
			area_name = row[0] ? row[0].force_encoding("UTF-8") : nil
			company = row[3] ? row[3].force_encoding("UTF-8") : nil
			phone = row[4] ? row[4].force_encoding("UTF-8") : nil
			email = row[5] ? row[5].force_encoding("UTF-8") : nil


			user = User.where("email like '%#{email}%' OR phone like '%#{area_name}%'").first
			user_clarify = User.where("username like '%#{username}%'").first
			p username
			if user_clarify
				username = username + email.delete("@.")
			end	
			unless user
				area = Area.find_by_name(area_name)
				u = User.new(	
					:username => username,					
					:name_of_company => company,
					:role_id => role_id,
					:phone => phone,
					:email => email,
					:password => "123456",
					:password_confirmation => "123456",
					:area_id => area.id,
					:is_read => true,
					:is_imported => true
				)				
		    
			    unless u.save
			    	tmp << username
			    	puts "#{u.errors.inspect}"
			    else
			    	puts "user======>>> %s" % u.id
				    u.reset_password_token = User.reset_password_token
				    u.save(:validate => false)
				    csv << [u.email, u.username, u.reset_password_token]
			    end
			else
			  	tmp << "#{row[1]} -- #{row[4]} -- #{row[5]}"
			end
		end
	end

	CSV.open("failed_tasks.csv", 'wb') do |csv|
		tmp.each {|f| csv << [f]}
	end
end