# -*- encoding : utf-8 -*-
class WeeklyStar < ActiveRecord::Base
  acts_as_taggable
  belongs_to :subject
  has_many :weekly_star_uploads

  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  attr_accessor :time
  has_attached_file :main_preview_img, :styles => {:thumb => "80x80#", :index=>"250x138#"},
                    :whiny_thumbnails => true,
                    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
                    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"
end