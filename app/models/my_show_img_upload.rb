class MyShowImgUpload < ActiveRecord::Base
  attr_accessible :img

  has_attached_file :img,
									  :styles => {:thumb => "491x363#"},
									  :whiny_thumbnails => true,
									  :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
									  :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
