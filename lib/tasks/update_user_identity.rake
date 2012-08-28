# -*- encoding: utf-8 -*-

desc "用户"
task :update_user_identity => :environment  do
	     tmp = [] 

	    CSV.foreach("#{Rails.root}/lib/data/email_recruit_design_count.csv") do |row|
			puts "starting................"

			area_name = row[0] ? row[0].force_encoding("UTF-8") : nil
            username = row[1] ? row[1].force_encoding("UTF-8") : nil
            phone = row[2] ? row[2].force_encoding("UTF-8") : nil
				    
		    user = User.where("username LIKE '%#{username}%' AND phone LIKE '%#{phone}%'").first 
 
			if user
				p username
				user.role_id = 1
				user.des_status = 0
				user.save(:validate => false)
				puts "user role changed======>>> %s" % user.role_id,user.des_status
				#csv << [user.id, user.username, area_name, user.role_chn_name, user.sign_in_count, user.designs.count]
            else
            	p "user do not exists"
            	tmp << "#{row[0]},#{row[1]},#{row[2]}}"
            end
        end 
     

    CSV.open("user_do_not_exist_20120828.csv", 'wb') do |csv|
		tmp.each {|f| csv << [f]}
	end
end	

