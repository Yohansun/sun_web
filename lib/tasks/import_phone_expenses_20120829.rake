# -*- encoding: utf-8 -*-
desc "话费"
task :import_phone_expenses_20120829 => :environment  do
	CSV.foreach("#{Rails.root}/lib/data/20120829.csv") do |row|
		user_email = row[0].gsub("\s", '')
		user_phone = row[1].gsub("\s", '')

		user1 = User.find 65560
		user1.update_attribute :email, '867619687@qq.com'

		user2 = User.find 65437
		user2.update_attribute :phone, '0371-56782761'

		users = User.where("phone like ? and email like ?", "#{user_phone}%", "#{user_email}%")
		if users.present?
			if users.size > 1
				puts "重复用户======>>> %s" % users.map(&:id)
			else
				p "**************"
				p user_phone
				user = users.first
				pe = PhoneExpense.new(user_id: user.id, register: row[2].to_f * row[3].to_f,
															design: row[4].to_f * row[5].to_f, vote: row[6].to_f * row[7].to_f,
															comment: row[8].to_f * row[9].to_f, share: row[10].to_f * row[11].to_f,
															inspiration: row[12].to_f * row[13].to_f, total: row[14].to_f)
				pe.save
			end	
		else
			puts "不存在用户======>>> %s" % user_phone
		end	
	end
end