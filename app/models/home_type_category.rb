# encoding: utf-8
class HomeTypeCategory < ActiveRecord::Base
  attr_accessible :tag, :tagable_id, :tagable_type
  belongs_to :tagable, :polymorphic => {:default => 'HomeType'}
  scope :categories, where("tag is not null")
end