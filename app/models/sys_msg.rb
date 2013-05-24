# -*- encoding : utf-8 -*-
class SysMsg < ActiveRecord::Base
  Status = { 0=> "new", 1 => "read" }

  MODULE = {:master_topics => "热点话题",
            :weekly_stars  => "每周之星",
            :designs       => "推荐作品",
            :inspirations  => "灵感秀",
            :color_designs => "色彩搭配",
            :events        => "年度色彩趋势活动",
            :messages      => "留言板",
            :baicheng      => "百城"
            }
   
  belongs_to :user

  belongs_to :site_message
  
  ##TODO 怎么排序
  default_scope :order => "created_at DESC"
  
  scope :baicheng,->{where(reply_type: :baicheng)}
  scope :unread,->{where(status: 0)}
  
  def self.send_to user,msg,others={}
    SysMsg.create({:content => msg,:status => SysMsg::Status[0], :reply_name => "系统",
          :user_id => user.id}.merge(others) )
  end
end
