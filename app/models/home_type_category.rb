# encoding: utf-8
class HomeTypeCategory < ActiveRecord::Base
  attr_accessible :tag, :tagable_id, :tagable_type
  belongs_to :tagable, :polymorphic => {:default => 'HomeType'}
  scope :types, where("tagable_type = ? ", "home_type")
  scope :costs, where("tagable_type = ? ", "home_cost")
  scope :colors, where("tagable_type = ? ", "home_color")
  scope :spaces, where("tagable_type = ? ", "home_space")
  scope :styles, where("tagable_type = ? ", "home_style")
end