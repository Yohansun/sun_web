# -*- encoding : utf-8 -*-
module MagicContent
  class MixColorsController < BaseController
    def index
      @mix_colors = MixColor.order('updated_at DESC').all
    end

    def show
      @mix_color = MixColor.find(params[:id])
      @customer_replies = CustomerReply.where(:question_id => @mix_color)
    end

    def edit
      @customer_reply = CustomerReply.new
    end

    def update
      @reply = CustomerReply.create(
                            :reply_content => params[:customer_reply][:reply_content],
                            #:reply_id => resource.user.id,
                            :question_id => params[:id],
                            :question_type => controller_name,
                            :user_id => resource.user.id
                          )

      SysMsg.create(:content => "#{CustomerReply.where(:question_id => params[:id]).order("updated_at desc").first.try(:reply_content)}",
                    :reply_type => "mix_color", :status => SysMsg::Status[0], :reply_name => "icolor客服",
                    :user_id => resource.user.id)
      if @reply
        MixColor.update(params[:id], :status => 1)
        redirect_to main_app.mix_colors_path
      else
        render :action => "edit"
      end
    end
  end
end