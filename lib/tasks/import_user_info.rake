# -*- encoding: utf-8 -*-

desc "导入用户"
task :source_user_infom => :environment  do
	tmp = []                                              #task shenyang
	CSV.open("njxzimported20120702.csv", 'wb') do |csv|
		CSV.foreach("#{Rails.root}/lib/data/2012_icolor_user/nanjingxuzhou_20120702.csv") do |row|
			puts "starting................"

			area_name = row[0] ? row[0].force_encoding("UTF-8") : nil
            username = row[1] ? row[1].force_encoding("UTF-8") : nil
			company = row[3] ? row[3].force_encoding("UTF-8") : nil
			phone = row[4] ? row[4].force_encoding("UTF-8") : nil
			email = row[5] ? row[5].force_encoding("UTF-8") : nil
			qq = row[6] ? row[6].force_encoding("UTF-8") : nil
			company_address = row[7] ? row[7].force_encoding("UTF-8") : nil

			user = User.where("email like '%#{email}%' OR phone like '%#{phone}%'").first
			user_clarify = User.where("username like '%#{username}%'").first
			p username
			if user_clarify
				username = username + email.delete("@.")
			end	
			if user && user.role_id != 2
				user.role_id = 2
				p "role_id adjusted"
			end	

			unless user
				area = Area.find_by_name(area_name)
				u = User.new(	
					:username => username,					
					:name_of_company => company,
					:role_id => 2,
					:phone => phone,
					:email => email,
					:password => "123456",
					:password_confirmation => "123456",
					:area_id => area.id,
					:is_read => true,
					:is_imported => true,
					:company_address => company_address,   #new add features
                    :qq => qq
				)				
		    
			    unless u.save
			    	tmp << username
			    	puts "#{u.errors.inspect}"
			    else
			    	puts "user======>>> %s" % u.id
				    u.reset_password_token = User.reset_password_token
				    u.save!
				    csv << [u.email, u.username, u.reset_password_token]
			    end
			else
			  	tmp << "#{row[1]} -- #{row[4]} -- #{row[5]}"
			end
		end
	end

	CSV.open("xznjfailed_tasks_20120702.csv", 'wb') do |csv|
		tmp.each {|f| csv << [f]}
	end

	# tmp = []                                      #task xuzhounanjing
	# CSV.open("xznjresult_reform.csv", 'wb') do |csv|
	# 	CSV.foreach("#{Rails.root}/lib/data/2012_icolor_user/xuzhou_nanjing_reform.csv") do |row|
	# 		puts "starting................"
			
	# 		if row[2] == "设计师"
	# 			role_id = 1
	# 		else
	# 			role_id = 2
	# 		end

# 			email = row[5] ? row[5].force_encoding("UTF-8") : nil
# 			username = row[1] ? row[1].force_encoding("UTF-8") : nil
# 			area_name = row[0] ? row[0].force_encoding("UTF-8") : nil
# 			company = row[3] ? row[3].force_encoding("UTF-8") : nil
# 			phone = row[4] ? row[4].force_encoding("UTF-8") : nil
# 			email = row[5] ? row[5].force_encoding("UTF-8") : nil


# 			user = User.where("email like '%#{email}%'").first
# 			user_clarify = User.where("username like '%#{username}%'").first
# 			p username
# 			if user_clarify
# 				username = username + email.delete("@.")
# 			end	
# 			if user
# 				user.destroy
# 				p "user destroyed!"
# 			end	
# 				area = Area.find_by_name(area_name)
# 				u = User.new(	
# 					:username => username,					
# 					:name_of_company => company,
# 					:role_id => role_id,
# 					:phone => phone,
# 					:email => email,
# 					:password => "123456",
# 					:password_confirmation => "123456",
# 					:area_id => area.id,
# 					:is_read => true,
# 					:is_imported => true					
# 				)				
		    
# 			    unless u.save
# 			    	tmp << username
# 			    	puts "#{u.errors.inspect}"
# 			    else
# 			    	puts "user======>>> %s" % u.id
# 				    u.reset_password_token = User.reset_password_token
# 				    u.save!
# 				    csv << [u.email, u.username, u.reset_password_token]
# 			    end
# 		end
# 	end

# 	CSV.open("njxzfailed_tasks.csv", 'wb') do |csv|
# 		tmp.each {|f| csv << [f]}
# 	end
 end