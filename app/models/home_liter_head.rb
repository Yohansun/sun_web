# encoding: utf-8
class HomeLiterHead < ActiveRecord::Base
  attr_accessible :title, :link, :order_id, :genre, :genre_type
  validates :title, :length => { :maximum => 12 } 
end