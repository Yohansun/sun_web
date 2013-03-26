# -*- encoding : utf-8 -*-
require 'ruby-pinyin'

class ImageLibraryCategory < ActiveRecord::Base
  acts_as_nested_set :counter_cache => :children_count
  attr_protected :lft, :rgt

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
