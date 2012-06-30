class Tool < ActiveRecord::Base
  attr_accessible :name, :img, :tag_list, :total, :has_applied
  acts_as_taggable

  has_attached_file :img,
									  :styles => {:thumb => "187x200#"},
									  :whiny_thumbnails => true,
									  :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
									  :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end