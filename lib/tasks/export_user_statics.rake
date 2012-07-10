# -*- encoding: utf-8 -*-

desc "用户"
task :export_user_statics => :environment  do
	tmp = [] 

	CSV.open("user_statics_export_20120710.csv", 'wb') do |csv| 
	     csv << ['用户ID','姓名','地区','身份','登录次数', '上传作品数']  
	     CSV.foreach("#{Rails.root}/lib/data/export_list.csv") do |row|
			puts "starting................"

			area_name = row[0] ? row[0].force_encoding("UTF-8") : nil
            username = row[1] ? row[1].force_encoding("UTF-8") : nil
            phone = row[2] ? row[2].force_encoding("UTF-8") : nil
			email = row[3] ? row[3].force_encoding("UTF-8") : nil
            unless email.blank?
	            if phone.blank?
	                user = User.where("email LIKE '%{email}%'").first
	            else
				    user = User.where("email LIKE '%#{email}%' OR phone LIKE '%#{phone}%'").first
	            end  
        	end
			if user
				p username
				puts "user======>>> %s" % user.id
				csv << [user.id, user.username, area_name, user.role_chn_name, user.sign_in_count, user.designs.count]
            else
            	p "user do not exists"
            	tmp << "#{row[0]},#{row[1]},#{row[2]},#{row[3]}"
            end
        end	
    end    

    CSV.open("user_do_not_exist_20120710.csv", 'wb') do |csv|
		tmp.each {|f| csv << [f]}
	end

end
