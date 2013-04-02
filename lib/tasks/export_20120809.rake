# -*- encoding : utf-8 -*-

desc "导入用户"
task :export_20120821 => :environment  do
	tmp = []                                              
  user_arr = []
    open("#{Rails.root}/lib/data/20130402_user.csv").readlines.each do |line|
      p line
      row = line.split("\t")
      p row
			puts "starting................"

      username         = row[0] ? row[0].strip.force_encoding("UTF-8") : nil
      email            = row[2] ? row[2].strip.force_encoding("UTF-8") : nil
      phone            = row[3] ? row[3].strip.force_encoding("UTF-8") : nil
      area_name        = row[4] ? row[4].strip.force_encoding("UTF-8") : nil
      company_address  = row[5] ? row[5].strip.force_encoding("UTF-8") : nil
      name_of_company  = row[6] ? row[6].strip.force_encoding("UTF-8") : nil
      qq               = row[7] ? row[7].strip.force_encoding("UTF-8") : nil
			name             = row[0] ? row[0].strip.force_encoding("UTF-8") : nil
			
			if row[1] && row[1].force_encoding("UTF-8") == "公司"
        role_id = 2
			elsif row[1].force_encoding("UTF-8") == "设计师"
        role_id = 1
      else
        role_id = 3
			end


			user = User.where("email like '%#{email}%' AND phone like '%#{phone}%'").first
			user_clarify = User.where("username like '%#{username}%'").first
			p username
			if user_clarify
				username = username + email.delete("@.")
			end		
			unless user
				area = Area.where("name like ?", area_name).first
        if area.present?
          area_id = area.id
        else
          area_id = 31
        end
				u = User.new(	
					:username => username,
					:name => name,
					:name_of_company => name_of_company,
					:qq => qq,
					:company_address => company_address,
					:role_id => role_id,
					:phone => phone,
					:email => email,
					:password => "123456",
					:password_confirmation => "123456",
					:area_id => area_id,
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
					user_arr << [u.id, u.email, u.username]
				end
			else			 	
				tmp << ["用户已存在:",user.id,row[1],row[2],row[3]]
			end 			
		end
	
  CSV.open("#{Rails.root}/lib/data/import_20130402.csv", 'wb') do |csv|
    user_arr.each {|f| csv << f}
  end

	CSV.open("#{Rails.root}/lib/data/failedtasks_20130402.csv", 'wb') do |csv|
		tmp.each {|f| csv << f}
	end
end	