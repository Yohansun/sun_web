# -*- encoding: UTF-8 -*-
desc "图库数据修改为不予审核"
task :udate_design_image_no_audited => :environment do
	image_id_arr = [99772,99773,99775,99776,99777,99778,99780,99781,99782,99783,99787,99793,99797,99799,99800,99802,99759,
		99760,99761,99762,99763,99764,99765,99766,99767,99768,99831,99832,99833,99841,99842,99843,99844,99845,99846,99829,
		99871,99872,99874,99875,99876,99877,99878,99879,99881,99882]
	image_id_arr.each do |id|
		puts "starting..........#{id}"
		design = Design.find(id)
		if design.present?
			design_images = design.design_images
			design_images.each do |design_image|
				design_image.last_user_id = 1
	      design_image.last_updated_at = Time.now
	      design_image.no_audited = true
	      design_image.audited = false
	      if design_image.save
					puts "updated %s " % design_image.id
				else
					puts "修改失败 %s " % id
				end
			end
		else
			puts "没有这条数据 %s " % id
		end
		
	end
end