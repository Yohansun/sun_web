class StoryImage < ActiveRecord::Base
  attr_accessible :is_cover, :user_id, :story_id, :file

  belongs_to :story
  has_many :tags, class_name: 'StoryImageTag',:dependent => :destroy

  has_attached_file :file,
    :styles => {:slide => "680x353#",:list =>"203x146#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
