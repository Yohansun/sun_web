class MixColor < ActiveRecord::Base
  has_attached_file :mix_color_img,
    :styles => { :thumb => "80x80#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
