# encoding: utf-8
class HxMap < ActiveRecord::Base
  attr_accessible :url, :hx_kv_id, :width, :high, :x_line, :y_line

  belongs_to :hx_kv
end
