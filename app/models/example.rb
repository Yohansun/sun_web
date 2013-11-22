class Example < ActiveRecord::Base
  has_attached_file :img,
    :styles => {:list => "210x156#", :show => "210x155#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
