#encoding: utf-8
class DialogCelebrity::MediaController < ApplicationController
  before_filter :require_login, only: [:index]
  skip_before_filter :verify_authenticity_token
  layout false

  def login
    if request.post?
      clear_cookie
      if media = Media.auth(params[:username], params[:password])
        cookies[:icolor_media_id] = { :value => media.id, :expires => 7.days.from_now }
        redirect_to "/dialog_celebrity/media/index", :notice => "登录成功"
      else
        redirect_to_media_login "用户名或密码错误"
      end
    end
  end

  def logout
    clear_cookie
    redirect_to_media_login "已退出!"
  end

  def index
    @boards = CelebrityContentBoard.where("id in (?)",current_media.boards.keys)
    @board_id = params[:board_id].blank? ? @boards.first.id : params[:board_id]
    @questions = CelebrityQuestion.where(:celebrity_content_board_id => @board_id)
    if params[:start_date].present? && params[:end_date].present?
      @questions = @questions.where("created_at >= ? and created_at <= ?",params[:start_date],params[:end_date].to_date+1.day)
    end
    if params[:key_type].present? && params[:keyword].present?
      @questions = case params[:key_type]
        when "title"
          @questions.where("name LIKE ?","%#{params[:keyword]}%")
        when "content"
          @questions.where("content LIKE ?","%#{params[:keyword]}%")
      end
    end
    @questions = @questions.page(params[:page]).per(8)
  end

  def update_question
    question_id = params[:question_id]
    reply_id    = params[:reply_id]
    content     = params[:content]
    image_ids   = params[:image_ids]
    if reply_id.present?
      reply = CelebrityQuestionReply.find(reply_id)
      reply.update_attributes(content: content)
    else
      reply = CelebrityQuestionReply.create media_id: current_media.id,celebrity_question_id: question_id.to_i, content: content
    end
    _image_ids = reply.images.map(&:id)
    if image_ids.present?
      image_ids.each do |image_id|
        if !_image_ids.include?(image_id.to_i)
          image = CelebrityQuestionImage.find(image_id)
          image.resource = reply
          image.save
        end
      end
    end
    render :json => {:code => 1, :reply_id => reply.id}
  end

  def upload_question_image
    image = CelebrityQuestionImage.new
    image.image = params[:file]
    if image.save
      render :json => {:code => 1, :notify => "上传成功",:url => image.image(:thumb),:id => image.id,:url2 => image.image(:slide)}
    else
      return render :json => {:notify => "保存失败"}
    end
  end

  def delete_question
    CelebrityQuestion.find(params[:id]).destroy
    render :json => { :notify => "删除成功" }
  end

  def delete_question_image
    CelebrityQuestionImage.find(params[:id]).destroy
    render :json => { :notify => "删除成功" }
  end

  helper_method :current_media

  protected

  def redirect_to_media_login notice=nil
    redirect_to("/dialog_celebrity/media/login",notice: notice)
  end

  def require_login
    redirect_to_media_login unless current_media
  end

  def current_media
    @current_media ||= find_by_cookie
  end

  def find_by_cookie
    user_id = cookies[:icolor_media_id]
    if user_id
      u = Media.where(:id => cookies[:icolor_media_id].to_i).first
      unless u
        cookies[:icolor_media_id] = nil
        nil
      end
      u
    else
      nil
    end
  end

  def clear_cookie
    cookies.delete(:icolor_media_id)
  end
end
