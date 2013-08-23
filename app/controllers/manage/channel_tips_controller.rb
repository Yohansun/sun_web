# encoding: utf-8
class Manage::ChannelTipsController < Manage::BaseController
  def index
    @channel_tips = ChannelTip.order("rank asc").all  
    @owner_enters = OwnerEnter.order("order_id asc")
  end

  def update_tip
    rank = 0
    @channel_tip = ChannelTip.find(params[:id])
    rank = @channel_tip.rank
    @channel_tip.title = params[:title]
    @channel_tip.rank = params[:rank]
    @channel_tip.content = params[:content]
    @channel_tip.link = params[:link]
    @channel_tip.admin_id = current_admin.id
    if @channel_tip.save
      unless rank.to_i == params[:rank].to_i
        ct = ChannelTip.where("rank = ? and updated_at < ?",@channel_tip.rank,@channel_tip.updated_at).first
        ct.rank = rank
        ct.save
      end
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
