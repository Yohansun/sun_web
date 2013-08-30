# encoding: utf-8
class HomeHead < ActiveRecord::Base
  attr_accessible :title, :link, :order_id, :file
  validates :title, :length => { :maximum => 12 }
  has_attached_file :file,
    :styles => {:thumb => "132x180#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end