# encoding: utf-8
class HomeSpace < ActiveRecord::Base
  attr_accessible :title, :link, :order_id, :file
  has_many :home_type_categories, :as => :tagable, :dependent => :destroy
  validates :title, :length => { :maximum => 12 }
  has_attached_file :file,
    :styles => {:thumb => "155x115#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end