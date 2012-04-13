# -*- encoding : utf-8 -*-
class SysMsg < ActiveRecord::Base
  Status = { 0=> "new", 1 => "read" }
  belongs_to :user

  ##TODO 怎么排序
  default_scope :order => "created_at DESC"

end
