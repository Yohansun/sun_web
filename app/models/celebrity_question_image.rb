class CelebrityQuestionImage < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :image
  belongs_to :resource, polymorphic: true

  has_attached_file :image, :styles => { :thumb => "64x64#",:thumb2 =>"150x90#",:slide => "640x480>",:upload_prew => "80x80#" },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
