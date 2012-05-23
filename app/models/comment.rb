# -*- encoding : utf-8 -*-
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :reply_msgs
  has_many :votes, :as => :voteable
  default_scope :order => "created_at DESC"
  paginates_per 10
  after_save :send_sys_msg
  def send_sys_msg
    if self.user
      user_display_name = self.user.display_name 
      user_id = self.user.id
      SysMsg.create(:content => "亲爱的#{user_display_name}用户，您的评论已成功！", 
        :reply_type => "site_message", :status => SysMsg::Status[0], :reply_name => "icolor客服", 
        :user_id => user_id)
    end
  end

end