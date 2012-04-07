class Avatar < ActiveRecord::Base
  belongs_to :user
  has_attached_file :file,
    :styles => {:upload => "155x135#", :profile => "194x194#", :icon => "48x48#", :thumb => "78x70#", :access_icon => "57x57#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end