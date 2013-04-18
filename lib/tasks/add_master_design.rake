# encoding: utf-8

# -*- encoding: utf-8 -*-
task :add_master_design_image_to_design_images => :environment  do
    MasterDesign.find_each do |item|
      file_src_arr = [item.main_preview_img.path(:original)]
      if file_src_arr.present?
        file_src_arr.each do |file_src|
          design_image = DesignImage.new
          handle = open(file_src) rescue nil
          handle.class.class_eval { attr_accessor :original_filename, :content_type }
          handle.original_filename = item.main_preview_img.try(:original_filename)
          design_image.file = handle
          design_image.title = item.design_name
          design_image.content =  item.design_intro
          design_image.user_id = 0
          design_image.imageable_id = item.id
          design_image.imageable_type = "MasterDesign"
          if design_image.save
            p "#{item.id}保存成功!"
          else
            p "保存失败!---#{row[0]}"
          end
        end
      end
    end
  end





  # encoding: utf-8

# -*- encoding: utf-8 -*-
task :add_week_tip => :environment  do
  tips = []
  WeeklyTip.find_each do |tip|
    t = tip.body.split("\r\n\r\n")
    time = (t.size)/2
    time.times do |i|
      tips << {:body => t[2*i] + "\r\n\r\n" + t[2*i+1], 
        :week => tip.week, :published_at => tip.published_at, :created_at => tip.created_at,
        :updated_at => tip.updated_at, :subject_id => tip.subject_id  }
      p "#{tip.id}+#{i} ===> success"
    end 
  end
  WeeklyTip.delete_all
  s = tips.size
  s.times do |i|
   w = WeeklyTip.new
   # w.id = tips[i][:id]
   w.week = tips[i][:week]
   w.body = tips[i][:body]
   w.published_at = tips[i][:published_at]
   w.subject_id = tips[i][:subject_id]
   w.created_at = tips[i][:created_at]
   w.updated_at = tips[i][:updated_at]
   w.save
   p"success !!!!!!" 
  end
end