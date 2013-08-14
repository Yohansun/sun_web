# encoding: utf-8
class Manage::ChannelTipsController < Manage::BaseController
  def index
    @channel_tips = ChannelTip.order("rank asc").all  
    @owner_enters = OwnerEnter.order("order_id asc")
  end

  def update_tip
    @channel_tip = ChannelTip.find(params[:id])
    @channel_tip.title = params[:title]
    @channel_tip.rank = params[:rank]
    @channel_tip.content = params[:content]
    @channel_tip.link = params[:link]
    @channel_tip.admin_id = current_admin.id
    if @channel_tip.save
      render js: "alert('保存成功!');location.reload();"
    else
      render js: "alert('保存失败!');"      
    end
  end

  def find_owner
    @owner_enter = OwnerEnter.find(params[:oe_id])
    @channel_tip = ChannelTip.find(params[:ct_id])
    @channel_tip.title = @owner_enter.title
    @channel_tip.content = @owner_enter.content[0..60]
    @channel_tip.link = @owner_enter.link
    @channel_tip.admin_id = current_admin.id
    if @channel_tip.save
      redirect_to main_app.channel_tips_path
    else
      redirect_to main_app.channel_tips_path
    end
  end
end
