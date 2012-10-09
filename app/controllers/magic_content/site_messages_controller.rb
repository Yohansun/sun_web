# -*- encoding : utf-8 -*-
module MagicContent
  class SiteMessagesController < BaseController
    def index
      sql_condition = "SELECT `site_messages`.* FROM `site_messages`
                       WHERE (site_messages.desc not REGEXP '上传失败|上传不了|上传报错|不能上传|上传不上|没法上传|传不上去')
                       ORDER BY updated_at DESC"
       @site_messages = SiteMessage.find_by_sql sql_condition
    end

    def update
      sys_msg = SysMsg.create(:content => params[:sys_msg]['content'], :reply_type => "site_message",
        :status => SysMsg::Status[0], :reply_name => "iColor客服",
        :user_id => resource.user.id, :site_message_id => resource.id)
      resource.update_attribute :sys_msg_id, sys_msg.id
      redirect_to main_app.site_messages_path
    end

    def show
      @site_message = SiteMessage.find(params[:id])
      @sys_msgs = @site_message.sys_msgs
    end
  end
end