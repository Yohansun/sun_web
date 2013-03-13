# -*- encoding: UTF-8 -*-
desc "更新design_images色彩搭配色号"
task :update_design_images_from_color_designs => :environment do
	@objs = DesignImage.where(:imageable_type=>'ColorDesign')
  @objs.each do |obj|

    if obj.color1.blank?
      obj.color1 = obj.imageable.recommend_color1 if obj.imageable.present?
    end

    if obj.color2.blank?
      obj.color2 = obj.imageable.recommend_color2 if obj.imageable.present?
    end

    if obj.color1.blank?
      obj.color3 = obj.imageable.recommend_color3 if obj.imageable.present?
    end

    if obj.color1_name.blank?
      obj.color1_name = obj.imageable.recommend_color_category1 if obj.imageable.present?
    end

    if obj.color2_name.blank?
      obj.color2_name = obj.imageable.recommend_color_category2 if obj.imageable.present?
    end

    if obj.color3_name.blank?
      obj.color3_name = obj.imageable.recommend_color_category3 if obj.imageable.present?
    end

    if obj.changed?
      if obj.save
        p "#{obj.id}
            #{obj.imageable.recommend_color1}
            #{obj.imageable.recommend_color2}
            #{obj.imageable.recommend_color3}
            #{obj.imageable.recommend_color_category1}
            #{obj.imageable.recommend_color_category2}
            #{obj.imageable.recommend_color_category3}"
      end
    end
    
  end
end

desc "更新design_images大师作品色号"
task :update_design_images_from_master_design_uploads => :environment do
  @objs = DesignImage.where(:imageable_type=>'MasterDesign')
  @objs.each do |obj|

    obj.imageable.master_design_uploads.each do |item|

      if obj.file_file_name == item.file_file_name
          obj.color1 = item.recommend_color1 if obj.color1.blank?
          obj.color2 = item.recommend_color2 if obj.color2.blank?
          obj.color3 = item.recommend_color2 if obj.color3.blank?
          obj.color1_name = item.recommend_color_category1 if obj.color1_name.blank?
          obj.color2_name = item.recommend_color_category2 if obj.color2_name.blank?
          obj.color3_name = item.recommend_color_category3 if obj.color3_name.blank?
      end
      
    end

    if obj.changed?
      if obj.save
        p "#{obj.id}
            #{obj.color1}
            #{obj.color2}
            #{obj.color3}
            #{obj.color1_name}
            #{obj.color2_name}
            #{obj.color3_name}"
      end
    end

  end
end