#encoding: utf-8
class KvMap < ActiveRecord::Base
  attr_accessible :high, :home_kv_id, :url, :width, :x_line, :y_line, :event_kv_id

  belongs_to :home_kv
  belongs_to :event_kv
  validates_presence_of :width, :high, :x_line, :y_line, message: '坐标值不能为空!'
  validates_numericality_of :width, :high, :x_line, :y_line, :only_integer => true
end
