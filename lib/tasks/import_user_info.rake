# -*- encoding: utf-8 -*-


desc "导入城市用户"
task :import_users => :environment  do
	CSV.foreach("#{Rails.root}/lib/data/user_20130502.csv") do |row|
		
		role = row[0] ? row[0].force_encoding("UTF-8") : nil
        unless role.blank?
			role_id = 2
		else
			role_id = 1
			des_status = 0
		end

		company = row[1] ? row[1].force_encoding('UTF-8') : nil
        name = row[2] ? row[2].force_encoding("UTF-8") : nil
        phone = row[3] ? row[3].force_encoding("UTF-8") : nil
		email = row[4] ? row[4].force_encoding("UTF-8") : nil			
		
		#p "#{role}|#{role_id}|#{company}|#{name}|#{phone}|#{email}"

		area = Area.find_by_name('南昌市')
		user = User.find_by_username(name)

		if user.blank?
			unless email.blank?
				u = User.new(
							:username => user.blank? ? "#{name}" : name,					
							:name_of_company => company,
							:name => name,
							:role_id => role_id,
							:phone => phone,
							:email => email,
							:password => "123456",
							:password_confirmation => "123456",
							:area_id => area.id,
							:is_read => true,
							:is_imported => true,
							:des_status => des_status#,
							#:company_address => company_address,   #new add features
		                    #:qq => qq
						)
				p "#{role_id}|#{company}|#{name}|#{phone}|#{email}|#{u.save}"
			else
				p "没有Email的用户: #{company}|#{name}|#{phone}|#{email}"
			end
		else
			p "已存在的用户: #{company}|#{name}|#{phone}|#{email}"
		end
	end
end


desc "导入用户"
task :source_user_infom => :environment  do
	tmp = []                                              
	CSV.open("mix_imported_20120803.csv", 'wb') do |csv|
		CSV.foreach("#{Rails.root}/lib/data/2012_icolor_user/20120803_mix.csv") do |row|
			puts "starting................"

            role = row[0] ? row[0].force_encoding("UTF-8") : nil
            if role == "家装公司"
				role_id = 2  				
			else
				role_id = 1
				des_status = 0
			end

			p row[0]

			area_name = row[1] ? row[1].force_encoding("UTF-8") : nil
            username = row[2] ? row[2].force_encoding("UTF-8") : nil
            name = row[3] ? row[3].force_encoding("UTF-8") : nil
			company = row[4] ? row[4].force_encoding("UTF-8") : nil			
			email = row[5] ? row[5].force_encoding("UTF-8") : nil
			phone = row[6] ? row[6].force_encoding("UTF-8") : nil
			qq = row[7] ? row[7].force_encoding("UTF-8") : nil
			company_address = row[8] ? row[8].force_encoding("UTF-8") : nil

			user = User.where("email like '%#{email}%' AND phone like '%#{phone}%'").first
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
					:name => name,
					:role_id => role_id,
					:phone => phone,
					:email => email,
					:password => "123456",
					:password_confirmation => "123456",
					:area_id => area.id,
					:is_read => true,
					:is_imported => true,
					:des_status => des_status,
					:company_address => company_address,   #new add features
                    :qq => qq
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
			    p "user already exist"				
			  	tmp << "#{row[1]},#{row[3]},#{row[4]}"
			end
	    end
	end

	CSV.open("mixfailedtasks_20120803.csv", 'wb') do |csv|
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