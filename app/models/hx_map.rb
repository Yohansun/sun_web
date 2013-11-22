# encoding: utf-8
class HxMap < ActiveRecord::Base
  attr_accessible :url, :hx_kv_id, :width, :high, :x_line, :y_line

  belongs_to :hx_kv
  validates_presence_of :width, :high, :x_line, :y_line, message: '坐标值不能为空!'
end
