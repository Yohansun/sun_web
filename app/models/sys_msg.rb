# -*- encoding : utf-8 -*-
class SysMsg < ActiveRecord::Base
  Status = { new: 0, read: 1 }

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
  default_scope :order => "id desc"

  scope :baicheng,->{where(reply_type: :baicheng)}
  scope :unread,->{where(status: SysMsg::Status[:new])}
  scope :baicheng_order,->{order('site_message_id desc')}


  def self.send_to user,msg,others={}
    SysMsg.create({:content => msg,:status => SysMsg::Status[:new], :reply_name => "系统",
          :user_id => user.id}.merge(others) )
  end

  def read
   self.status =  SysMsg::Status[:read]
   self.save
  end
end
