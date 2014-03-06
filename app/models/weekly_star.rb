# -*- encoding : utf-8 -*-
class WeeklyStar < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  has_many :weekly_star_uploads

  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
  has_many :collects, :dependent => :destroy

  attr_accessor :time
  has_attached_file :main_preview_img, :styles => {:thumb => "80x80#", :index=>"230x138#",:image_show => "178x128#",:week_like => "110x80>", :index_list => "210x156#"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  scope :from, where("created_at > (?)", "2013-3-1")

  STAR_TYPE = {
    1 => "每周之星",
    2 => "月度色彩之星",
    3 => "月度设计之星"
  }

  def star_type
    STAR_TYPE[star_type_id]
  end

  def self.get_star_type_id(arg)
    STAR_TYPE.key(arg)
  end

  def user_id
    author_url.scan(/(\d+)(\/designs)/) && $1 if author_url.present?
  end
end