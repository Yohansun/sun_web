# -*- encoding : utf-8 -*-
class SysMsg < ActiveRecord::Base
  Status = { 0=> "new", 1 => "read" }

  MODULE = {:master_topics => "热点话题",
            :weekly_stars  => "每周之星",
            :designs       => "推荐作品",
            :inspirations  => "灵感秀",
            :color_designs => "色彩搭配",
            :events        => "年度色彩趋势活动",
            :messages      => "留言板"
            }

  belongs_to :user

  ##TODO 怎么排序
  default_scope :order => "created_at DESC"

end
