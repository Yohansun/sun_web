# -*- encoding : utf-8 -*-
require "csv"
desc "icolor用户联系方式"
task :export_user_contact_information => :environment  do

	users = User.select("id,username,name,phone")

	EXPORT_CONDITION.each do |key,value|
		CSV.open("#{Rails.root}/lib/data/#{key}_user_contact_information.csv", "wb") do |csv|
			csv << ['用户ID','姓名(发送者）','移动手机号码+电信手机号码','联通手机号码']

			puts value
			users_data = users.send(value[0],value[1])
 			puts "users_data %s" % users_data

 			#移动：139、138、137、136、135、134（0-8）、157、158、159、150、151、152、182、183、187、188（3G）、147（数据卡）
			#中国联通号段：130、131、132、155、156、186（3G）
			#中国电信号段：133、153、189 （3G）、180

			users_data.each do |u|

				name = u.username.blank? ? u.name : u.username	
				id = u.id	

				if u.phone =~ /^13[3..9]|^147|^15[0,1,2,3,7,8,9]|^18[0,2,3,7,8,9]/
					phone1 = u.phone
				elsif u.phone =~ /^13[0..2]|^15[5,6]|^186/
					phone2 = u.phone
				end	
				csv << [id,name,phone1,phone2]		
			end				
		end	
	end	
end

EXPORT_CONDITION = {
	"all" => ["find","all".to_sym],
	"designer_w" => ["where","role_id=1 and des_status = false"],
	"designer_s" => ["where","role_id=1 and des_status = true"],
	"company" => ["where","role_id=2"],
	"user" => ["where","role_id=3"],
	"old_user" => ["where","role_id=3 and old_id is not null"],
	"old_designer_w" => ["where","role_id=1 and des_status = false and old_id is not null"],
	"old_designer_s" => ["where","role_id=1 and des_status = true and old_id is not null"]
}