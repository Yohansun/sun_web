# -*- encoding : utf-8 -*-
class ImageLibraryCategory < ActiveRecord::Base
  acts_as_nested_set :counter_cache => :children_count
  attr_protected :lft, :rgt
end