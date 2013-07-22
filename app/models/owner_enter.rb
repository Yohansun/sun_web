#encoding:utf-8
class OwnerEnter < ActiveRecord::Base
  attr_accessible :content, :title, :link, :user_id, :order_id
  belongs_to :user
  validates :order_id, :presence => true
end