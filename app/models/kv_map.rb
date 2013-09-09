#encoding: utf-8
class KvMap < ActiveRecord::Base
  attr_accessible :high, :home_kv_id, :url, :width, :x_line, :y_line

  belongs_to :home_kv
end
