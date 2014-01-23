# encoding: utf-8
class EventKv < ActiveRecord::Base
  attr_accessible :klass_name, :url, :file

  has_many :kv_maps,:dependent => :destroy

  scope :page_name,->(klass_name){ where(klass_name: klass_name)}

  has_attached_file :file,
    :styles => {:big => "730x300#", :gift_kv => "1000x400#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end
