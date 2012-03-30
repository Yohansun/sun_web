class MasterProfile < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  has_many :master_designs
  attr_accessor :time
  default_scope order("published_at DESC")

  has_attached_file :preview_img_in, :styles => { :thumb => "80x80#", :original => "477x317#" }
  has_attached_file :preview_img_out, :styles => { :thumb => "80x80#", :original => "278x282#" }
end
