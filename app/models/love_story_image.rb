# encoding: utf-8
class LoveStoryImage < ActiveRecord::Base
  attr_accessible :user_id, :story_id, :file

  belongs_to :user
  belongs_to :love_story

  has_attached_file :file,
    :styles => {:small => "680x353>",:list =>"203x146#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end
