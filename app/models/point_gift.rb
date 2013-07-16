class PointGift < ActiveRecord::Base
  
  has_attached_file :file,
    :styles => {:list => "192x152#", :thumb => "115x72#"},
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  scope :flag_on, where(flag: true)

end
