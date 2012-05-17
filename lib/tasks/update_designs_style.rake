# -*- encoding: utf-8 -*-
desc "更新作品风格"
task :update_designs_style => :environment do
	Design.find_each do |design|
		puts "****" * 20
		puts "Design %s" % design.id
		case design.style
		when "美式", "欧式"
			design.update_attributes!(:style => "欧美流行系")
		when "现代简约", "后现代"
			design.update_attributes!(:style => "现代简约派")
		when "田园"
			design.update_attributes!(:style => "清新田园风")
		when "混搭"
			design.update_attributes!(:style => "混搭")
		when "中式", "日式", "新古典"
			design.update_attributes!(:style => "东方新古典")
		when "地中海", "东南亚", "其他"
			design.update_attributes!(:style => "其他")
		end
	end

	ColorDesign.find_each do |cdesign|
		puts "****" * 20
		puts "ColorDesign %s" % cdesign.id
		case cdesign.design_style
		when "美式", "欧式"
			cdesign.update_attributes!(:design_style => "欧美流行系")
		when "现代简约", "后现代"
			cdesign.update_attributes!(:design_style => "现代简约派")
		when "田园"
			cdesign.update_attributes!(:design_style => "清新田园风")
		when "混搭"
			cdesign.update_attributes!(:design_style => "混搭")
		when "中式", "日式", "新古典"
			cdesign.update_attributes!(:design_style => "东方新古典")
		when "地中海", "东南亚", "其他"
			cdesign.update_attributes!(:design_style => "其他")
		end
	end

	WeeklyStar.find_each do |star|
		puts "****" * 20
		puts "WeeklyStar %s" % star.id
		case star.design_style
		when "美式", "欧式"
			star.update_attributes!(:design_style => "欧美流行系")
		when "现代简约", "后现代"
			star.update_attributes!(:design_style => "现代简约派")
		when "田园"
			star.update_attributes!(:design_style => "清新田园风")
		when "混搭"
			star.update_attributes!(:design_style => "混搭")
		when "中式", "日式", "新古典"
			star.update_attributes!(:design_style => "东方新古典")
		when "地中海", "东南亚", "其他"
			star.update_attributes!(:design_style => "其他")
		end
	end

end