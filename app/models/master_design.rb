class MasterDesign < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  belongs_to :master_profile
  has_many :master_design_uploads
  has_many :collects

  attr_accessor :time
  default_scope order("published_at DESC")

  has_attached_file :main_preview_img, :styles => { :fullscreen_thumb => "60x45#",:thumb => "80x80#", :index => "459x275#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

end