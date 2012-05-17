# -*- encoding : utf-8 -*-
module MagicContent
  class SiteMessagesController < BaseController
    def index 
       @site_messages = SiteMessage.order('updated_at DESC').all
    end

    def update
      sys_msg = SysMsg.create(:content => params[:sys_msg]['content'], :reply_type => "site_message",
        :status => SysMsg::Status[0], :reply_name => "iColor客服",
        :user_id => resource.user.id)
      resource.sys_msg_id = sys_msg.id
      resource.save
      redirect_to main_app.site_messages_path
    end

    def show
      @site_message = SiteMessage.find(params[:id])
      @sys_msg = SysMsg.find(@site_message.sys_msg_id)
    end
  end
end