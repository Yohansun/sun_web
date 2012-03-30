class MasterDesign < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  belongs_to :master_profile
  attr_accessor :time
  default_scope order("published_at DESC")

  has_attached_file :main_preview_img, :styles => { :thumb => "80x80#"}
end
