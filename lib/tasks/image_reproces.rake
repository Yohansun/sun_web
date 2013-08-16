# -*- encoding: utf-8 -*-

desc "重新压缩图片"
task :master_profile_reproces => :environment  do
	MasterProfile.find_each{|image| image.preview_img_in.reprocess! if image.preview_img_in; p image.id}
end

task :story_image_reproces => :environment  do
	StoryImage.find_each{|image| image.file.reprocess! if image.file; p image.id}
end

task :design_image_reproces => :environment  do
	DesignImage.find_each{|image| image.file.reprocess! if image.file; p image.id}
end