# -*- encoding: utf-8 -*-
desc "生成reset token"
task :reset_password => :environment  do
	@@area = Area.find_by_name("沈阳")
	return if @@area.nil?	
	count = 0

	CSV.open("result.csv", 'wb') do |csv|

		CSV.foreach("#{Rails.root}/lib/data/syjz.csv") do |row|
			count +=1 unless g_date(row[2].force_encoding("UTF-8"), row[1].force_encoding("UTF-8"), csv)
	  end

	  CSV.foreach("#{Rails.root}/lib/data/sysjs.csv") do |row|
			count +=1 unless g_date(row[2].force_encoding("UTF-8"), row[1].force_encoding("UTF-8"), csv)
	  end
  end

  p count
end

def g_date(email, name, csv)
	p "#{name} -- #{email}"
	user = User.where("name = '#{name}' AND email = '#{email}' AND area_id = #{@@area.id}").first
	if user
		p "found"
		user.reset_password_token = User.reset_password_token
		user.save(:validate => false)
		csv << [email, name, user.reset_password_token]
	else
		return nil	
	end
end
