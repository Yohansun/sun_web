# -*- encoding: utf-8 -*-
class CustomMeta < ActiveRecord::Base
  attr_accessible :fullpath, :description, :keywords, :title
  validates_uniqueness_of :fullpath
end
