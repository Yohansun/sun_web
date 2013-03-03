# -*- encoding : utf-8 -*-
class ColorDesign < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject

  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  has_many :collects, :dependent => :destroy
  has_many :design_images

  attr_accessor :time
  has_attached_file :main_preview_img, :styles => { :thumb => "80x80#", :index => "291x315#", :home_page =>"380x170#"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  has_attached_file :show_preview_img, :styles => { :thumb => "80x80#", :slide => "888x590>"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"


  def title
    self.design_name
  end
end
