# encoding: utf-8
class DesignerEvent < ActiveRecord::Base
  attr_accessible :content, :end_time, :intro, :start_time, :title, :file, :is_save

  has_attached_file :file,
    :styles => {:list => "280x145#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end
