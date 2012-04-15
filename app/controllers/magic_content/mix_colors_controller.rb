# -*- encoding : utf-8 -*-
module MagicContent
  class MixColorsController < BaseController
    def index

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
      if @reply
        MixColor.update(params[:id], :status => 1)
        redirect_to main_app.mix_colors_path
      else
        render :action => "edit"
      end
    end
  end
end