# encoding: utf-8
class Collect < ActiveRecord::Base
  belongs_to :design_image, :counter_cache => true
  belongs_to :user
  belongs_to :weekly_star
  belongs_to :design
  belongs_to :color_design
  belongs_to :master_design
  belongs_to :inspiration
  validates_uniqueness_of :user_id, :scope => [:color_design_id, :design_image_id, :inspiration_id, :master_design_id, :weekly_star_id], :message => "you have already collect it"
end