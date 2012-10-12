# -*- encoding : utf-8 -*-
class SiteMessage < ActiveRecord::Base
#  validates :desc, :presence => :true, :length => { :minimum => 10}
  after_save :send_sys_msg
  belongs_to :user
  has_many :comments, :as => :commentable

  has_many :sys_msgs

  after_create :deliver

  def comments_count
    self.comments.length
  end

  def send_sys_msg
    user_display_name = self.user.display_name
    user_id = self.user.id
    SysMsg.create(:content => "亲爱的#{user_display_name}您好！您的问题我们已经收到，我们会尽快给你答复，届时请注意查看系统消息，谢谢！",
                  :reply_type => "site_message", :status => SysMsg::Status[0], :reply_name => "iColor客服",
                  :user_id => user_id)
  end

  def deliver
    Notifier.inform(self.user,self.desc).deliver unless self.desc =~ /上传失败|上传不了|上传报错|不能上传|上传不上|没法上传|传不上去/
  end
end