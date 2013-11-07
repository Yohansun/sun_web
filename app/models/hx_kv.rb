# encoding: utf-8
class HxKv < ActiveRecord::Base
  attr_accessible :position, :url, :file

  has_many :hx_maps, :dependent => :destroy

  has_attached_file :file,
    :styles => {:big => "670x283#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end
