#encoding: utf-8
class KvMap < ActiveRecord::Base
  attr_accessible :high, :home_kv_id, :url, :width, :x_line, :y_line, :event_kv_id

  belongs_to :home_kv
  belongs_to :event_kv
end
