class MasterDesignUpload < ActiveRecord::Base
  belongs_to :master_design
  has_attached_file :file, :styles => {:thumb => "105x97#", :slide => "550x365#", :fullscreen => "980x655>", :home_page => "367x240#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end