# -*- encoding: utf-8 -*-

desc "导入用户"
task :export_20120821 => :environment  do
	tmp = []                                              

	CSV.open("#{Rails.root}/public/imported_20120821.csv", 'wb') do |csv|
		CSV.foreach("#{Rails.root}/lib/data/2012_icolor_user/20120821.csv") do |row|
			puts "starting................"

			area_name        = row[0] ? row[0].strip.force_encoding("UTF-8") : nil
			username         = row[1] ? row[1].strip.force_encoding("UTF-8") : nil
			name_of_company  = row[1] ? row[1].strip.force_encoding("UTF-8") : nil
			phone            = row[2] ? row[2].strip.force_encoding("UTF-8") : nil
			email            = row[3] ? row[3].strip.force_encoding("UTF-8") : nil
			name             = row[4] ? row[4].strip.force_encoding("UTF-8") : nil
			qq               = row[5] ? row[5].strip.force_encoding("UTF-8") : nil
			company_address  = row[6] ? row[6].strip.force_encoding("UTF-8") : nil

			user = User.where("email like '%#{email}%' AND phone like '%#{phone}%'").first
			user_clarify = User.where("username like '%#{username}%'").first
			p username
			if user_clarify
				username = username + email.delete("@.")
			end		
			unless user
				area = Area.where("name like ?", area_name).first
				u = User.new(	
					:username => username,
					:name => name,
					:name_of_company => name_of_company,
					:qq => qq,
					:company_address => company_address,
					:role_id => 2,
					:phone => phone,
					:email => email,
					:password => "123456",
					:password_confirmation => "123456",
					:area_id => area.id,
					:is_read => true,
					:is_imported => true
					)

				unless u.save
					tmp << ["用户创建失败:",username,u.errors.messages.map {|key,value| value}.flatten]
					puts "#{u.errors.messages}"
				else
					puts "user======>>> %s" % u.id
					u.reset_password_token = User.reset_password_token
					u.save(:validate => false)
					csv << [u.id, u.email, u.username, u.reset_password_token]
				end
			else			 	
				tmp << ["用户已存在:",user.id,row[1],row[2],row[3]]
			end 			
		end
	end
	

	CSV.open("#{Rails.root}/public/failedtasks_20120821.csv", 'wb') do |csv|
		tmp.each {|f| csv << f}
	end
end	