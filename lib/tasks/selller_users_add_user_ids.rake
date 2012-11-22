# -*- encoding: utf-8 -*-
desc "经销商绑定家装公司"
task :add_user_ids => :environment  do
	seller_users = SellerUser.all
	
	seller_users.each do |seller_user| 
	  user_ids = ""
	  users = User.where(area_id: seller_user.area_id,role_id: 2).map &:id
	  users.each do |user_id|
	  	user_ids +=  user_id.to_s + ","
	  end
	  seller_user.user_ids = user_ids
	  if seller_user.save!
	  	puts "id==========  #{seller_user.id},#{seller_user.area_id}  &&& user_ids ==========> %s " % seller_user.user_ids
	  else
	  	puts 'No!!!!!!!!!!!!!!!!!!!!'
	  end
	end
end