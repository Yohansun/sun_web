class ContractImage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :contract
  has_attached_file :file,
    :styles => {:thumb => "60x45#", :spring_img => "373x261#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end
