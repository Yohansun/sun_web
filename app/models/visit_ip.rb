# -*- encoding : utf-8 -*-
class VisitIp < ActiveRecord::Base
  attr_accessible :ip

  validates_presence_of :ip
  validates_uniqueness_of :ip
end
