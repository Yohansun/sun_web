# -*- encoding : utf-8 -*-
require 'ruby-pinyin'

class ImageLibraryCategory < ActiveRecord::Base
  acts_as_cached(:version => 1, :expires_in => 1.week)

  acts_as_nested_set :counter_cache => :children_count
  attr_protected :lft, :rgt
  scope :style,->{where(parent_id: 34)}
  scope :cost,->{where(parent_id: 19)}

  scope :parent_categories, ->{
    where("parent_id is null AND title != '按建筑'").includes(:children).order("position")
  }

  before_save :set_pinyin

  def set_pinyin
    if self.title_changed?
      set_pinyin!
    end
  end

  def set_pinyin!
    self.pinyin = PinYin.of_string(self.title[0]).first.to_s
  end

end
