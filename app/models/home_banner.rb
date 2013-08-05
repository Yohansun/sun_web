# encoding: utf-8
class HomeBanner < ActiveRecord::Base
  attr_accessible :banner_name, :user_id, :file
  belongs_to :user

  has_attached_file :file,
    :styles => {:thumb => "60x45#", :chief => "270x100>",:owner_enter =>"290x200>", :bottom_big => "670x85>", :bottome_little => "310x85>", :master => "1000x85>"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end

