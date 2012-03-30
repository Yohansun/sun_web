class MasterDesign < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  belongs_to :master_profile
  has_many :master_design_uploads

  attr_accessor :time
  default_scope order("published_at DESC")

  has_attached_file :main_preview_img, :styles => { :thumb => "80x80#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end