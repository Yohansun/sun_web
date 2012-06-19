# -*- encoding: utf-8 -*-
desc "统计招募用户数据"
task :zm_user => :environment  do
	dl1 = 0
	zp1 = 0
	dl2 = 0
	zp2 = 0

	CSV.foreach("#{Rails.root}/lib/data/sms_zm.csv") do |row|
		name = row[1]
		mobile = row[2]
		p "#{name} -- #{mobile}"
		user = User.where("name = '#{name}' AND phone = '#{mobile}' AND sign_in_count > 0").first
		if user
			dl1 += 1
			if user.desgins.count > 0
				zp1 += 1
			end
		end
  end

  CSV.foreach("#{Rails.root}/lib/data/icolor_zm.csv") do |row|
		name = row[0]
		mobile = row[1]
		p "#{name} -- #{mobile}"

		user = User.where("name = '#{name}' AND phone = '#{mobile}' AND sign_in_count > 0").first
		if user
			dl1 += 1
			if user.desgins.count > 0
				zp1 += 1
			end
		end
  end

  p "dl1 ++ zp1"
  p "dl2 ++ zp2"
end
