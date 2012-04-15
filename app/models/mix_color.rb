# -*- encoding : utf-8 -*-
class MixColor < ActiveRecord::Base
  belongs_to :user
  after_create :send_sys_msg
  has_attached_file :mix_color_img,
    :styles => { :thumb => "80x80#"},
    :whiny_thumbnails => true,
    :url => "/system/:class/:attachment/:id_partition/:style/:id.:extension",
    :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:id.:extension"

  MixStatus = {
    0 => "未解决",
    1 => "已解决"
  }
  def send_sys_msg
    user_display_name = self.user.display_name
    user_id = self.user.id
    SysMsg.create(:content => "亲爱的#{user_display_name}您好！我们已经收到了您的配色需求，我们会在7个工作日内为您提供个性化配色建议，届时请注意查看系统消息，谢谢！",
                  :reply_type => "site_message", :status => SysMsg::Status[0], :reply_name => "icolor客服",
                  :user_id => user_id)
  end

end
