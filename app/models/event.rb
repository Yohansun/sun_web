# -*- encoding : utf-8 -*-
class Event < ActiveRecord::Base
  #attr_accessible :title, :body
  has_attached_file :event_img,
    :styles => { :thumb => "80x80#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  #validates_attachment_content_type :event_img, :content_type => 'image/jpeg'
  
end
