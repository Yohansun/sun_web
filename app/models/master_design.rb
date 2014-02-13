class MasterDesign < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  belongs_to :master_profile
  has_many :master_design_uploads
  has_many :collects, :dependent => :destroy
  has_many :design_images

  attr_accessor :time
  default_scope order("published_at DESC")

  has_attached_file :main_preview_img, :styles => { :fullscreen_thumb => "60x45#",:thumb => "80x80#", :index => "459x275#", :mobile_index => "145x150#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"


  def title
    self.design_name
  end

  def cover_design_upload
    master_design_uploads.where(:is_cover => true).first
  end
end