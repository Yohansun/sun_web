# -*- encoding: utf-8 -*-

desc "用户"
task :update_user_recruit_key => :environment  do
	    tmp = [] 

	    CSV.foreach("#{Rails.root}/lib/data/update_user_recruit_key.csv") do |row|
			puts "starting................"

			id = row[0]
				    
		    user = User.where(id: id).first
 
			if user
				p id
				user.is_imported = true
				user.save(:validate => false)
				puts "user recruit_key changed======>>> %s" % user.is_imported
				#csv << [user.id, user.username, area_name, user.role_chn_name, user.sign_in_count, user.designs.count]
            else
            	p "user do not exists"
            	tmp << "#{row[0]},#{row[1]},#{row[2]}}"
            end
        end 
     

    CSV.open("user_do_not_exist_20120910.csv", 'wb') do |csv|
		tmp.each {|f| csv << [f]}
	end
end	