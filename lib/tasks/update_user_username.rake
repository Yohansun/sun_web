# -*- encoding: utf-8 -*-

desc "用户"
task :update_user_username => :environment  do
	     tmp = [] 

	    CSV.foreach("#{Rails.root}/lib/data/20120711_update_username.csv") do |row|
			puts "starting................"

			name_of_company = row[0] ? row[0].force_encoding("UTF-8") : nil
            username = row[1] ? row[1].force_encoding("UTF-8") : nil
            email = row[2] ? row[2].force_encoding("UTF-8") : nil
			phone = row[3] ? row[3].force_encoding("UTF-8") : nil

                if (email.blank?) || (phone.blank?) || (email.blank? && phone.blank?)
	            else
				    user = User.where("email LIKE '%#{email}%' AND phone LIKE '%#{phone}%'").first
	            end  
 

			if user
				p username
				user.name = user.username
				user.username = name_of_company
				user.save
				puts "username changed======>>> %s" % user.username,user.name
				#csv << [user.id, user.username, area_name, user.role_chn_name, user.sign_in_count, user.designs.count]
            else
            	p "user do not exists"
            	tmp << "#{row[0]},#{row[1]},#{row[2]},#{row[3]}"
            end
        end 
     

    CSV.open("user_do_not_exist_20120711.csv", 'wb') do |csv|
		tmp.each {|f| csv << [f]}
	end
end	

