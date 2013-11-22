class Team < ActiveRecord::Base
  attr_accessible :name, :job, :url
  has_attached_file :file,
    :styles => {:list => "210x212#", :show => "210x155#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
