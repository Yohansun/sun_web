# -*- encoding : utf-8 -*-
module MagicContent
  class MixColorsController < BaseController
    def index

    end

    def edit
      @customer_reply = CustomerReply.new
    end

    def update
      @mix = MixColor.where("id = ?", params[:id])
      msg = "亲爱的#{@mix.to_a[0].user.display_name}您好！我们根据您提出的问题，设计了与您的家居与软装设计最适合的搭配风格供您参考，希望能给到您帮助！针对您问题里的“#{@mix.to_a[0].description}”，我们建议#{params[:customer_reply][:reply_content]}"
      @reply = CustomerReply.create( :reply_content => msg,
                            :reply_id => current_user.id,
                            :question_id => params[:id],
                            :question_type => controller_name
                          )
      if @reply
        MixColor.update(params[:id], :status => 1)
        redirect_to "/admin/content/mix_colors"
      else
        render :action => "edit"
      end
    end
  end
end