# -*- encoding : utf-8 -*-
class ColorDesign < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject

  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  attr_accessor :time
  has_attached_file :main_preview_img, :styles => { :thumb => "80x80#", :index => "291x315#"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  has_attached_file :show_preview_img, :styles => { :thumb => "80x80#", :slide => "888x590>"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  def self.color_select
    ['所有','浅白色系','红色系','橙色系','黄色系','绿色系','蓝色系','紫色系','中性色系']
  end
  def self.style_select
    ['所有','美式','欧式','中式','日式','地中海','田园','东南亚','现代简约','后现代','新古典','混搭','其他']

  end
  def self.usage_select
    ['所有','客厅','餐厅','厨房','卫生间','书房','儿童房','阳台','门厅','储物间','其他']
  end

  def self.order_select
    ['最新','最热']
  end


end
