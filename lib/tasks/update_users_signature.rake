# -*- encoding : utf-8 -*-
desc "修改片区快查设计师列表的设计师签名"

task :update_users_signature => :environment  do
	User.find_each do |user|
		if user.signature.blank? && DESIGNER["#{user.id}"].blank?
			user.signature = "这个家伙很懒，什么也没留下"
	  elsif !DESIGNER["#{user.id}"].blank?
	  	user.signature = DESIGNER["#{user.id}"]
	  end 	
		user.save!(:validate => false)
	end
end

DESIGNER = {
	"3798" => "出色的色彩搭配能力，擅长欧式、波西米亚风格",
	"3732" => "年轻的设计师后起之秀",
	"1787" => "经验丰富，作品众多，擅长欧式、中式、现代简约",
	"3800" => "擅长高贵风格，年轻男设计师",
	"1118" => "多年设计经验，众多案例作品，擅长各种风格设计",
	"3923" => "可爱的美女设计师，擅长风格新古典",
	"1734" => "曾为上海万科、苏州金鸡湖国宾一号担任设计、擅长别墅、样板房设计",
	"78" => "尤其擅长中式设计风格",
	"1023" => "年轻男设计师，主要作品以现代简约为主"
}