# encoding: utf-8
class HxNews < ActiveRecord::Base
  attr_accessible :position, :title, :url

  scope :positions, -> {where(["position IS NOT NULL"])}
end
