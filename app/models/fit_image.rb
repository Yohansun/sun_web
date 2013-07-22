# encoding: utf-8
class FitImage < ActiveRecord::Base
  attr_accessible :title, :link, :file

  has_attached_file :file,
    :styles => {:img => "138x165>"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end

