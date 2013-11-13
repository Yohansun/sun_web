# encoding: utf-8
class Huaxun::ConsultsController < Huaxun::BaseController
  def index
    @replies = Reply.where(genre: 'huaxun').order("id desc").page(params[:page]).per(8)
  end

  def create_reply
    if params[:rep_content].present?
      rep_reply = RepReply.find(params[:rep_res_id]) if params[:rep_res_id].present?
      rep_reply = RepReply.new unless rep_reply.present?
      rep_reply.user_id = current_user.id
      rep_reply.reply_id = params[:reply_id]
      rep_reply.content = params[:rep_content]
      rep_reply.save
      redirect_to consults_path, notice: "回复成功!"
    else
      rep_reply = RepReply.find(params[:rep_res_id]) if params[:rep_res_id].present?
      rep_reply.destroy if rep_reply.present?
      redirect_to consults_path, notice: "删除成功!"
    end

  end

  def search_reply
    @replies = Reply.where(genre: 'huaxun')
    if params[:rep_value].present?
      if params[:rep_where] == "rep_name"
        user = User.where("username = ? or name = ?",params[:rep_value],params[:rep_value]).group("id")
        @replies = @replies.where("reply_user_id in (?)", user) if user.present?
      else
        @replies = @replies.where("content like ?", "%#{params[:rep_value]}%")
      end
    end
    if params[:start_time].present?
      start_time = DateTime.strptime(params[:start_time],'%Y-%m-%d')
    else
      start_time = DateTime.strptime("2010-01-01",'%Y-%m-%d')
    end
    if params[:end_time].present?
      end_time = DateTime.strptime(params[:end_time],'%Y-%m-%d')
    else
      end_time = Time.now
    end
    if params[:is_reply] == "no_reply"
      @replies = @replies.includes(:rep_replies).select("distinct replies.id, replies.*").where("rep_replies.id is null or rep_replies.user_id != ? ",current_user)
    elsif params[:is_reply] == "yes_reply"
      @replies = @replies.joins(:rep_replies).select("distinct replies.id, replies.*").where("rep_replies.user_id = ? ", current_user.id)
    end
    @replies = @replies.where(created_at: start_time.beginning_of_day..end_time.end_of_day).order("replies.id desc").page(params[:page]).per(8)
    render :index
  end
end
