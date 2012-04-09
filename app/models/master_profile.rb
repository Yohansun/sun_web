# -*- encoding : utf-8 -*-
class MasterProfile < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  has_many :master_designs
  attr_accessor :time
  default_scope order("published_at DESC")

  has_attached_file :preview_img_in,
    :styles => { :thumb => "80x80#", :original => "477x317#" },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  has_attached_file :preview_img_out,
    :styles => { :thumb => "80x80#", :original => "278x282#" },
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def self.tag_list
    array = ['海外','港澳台','中国大陆']
    array.each do |i|
      i = URI.escape(i)
    end
    array
  end

end