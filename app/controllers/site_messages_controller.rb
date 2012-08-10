class SiteMessagesController < InheritedResources::Base
  before_filter :find_user

  def index
    render :template => "users/site_messages" if @user
  end

  def show
    @site_messages = SiteMessage.find(params[:id]) || SiteMessage.new
    @comments = @site_messages.comments.page params[:page]
  end

  def create
    return unless current_user

    @site_message = SiteMessage.new(params[:site_message])
    @site_message.user_id = current_user.id
    create! do |succ, fail|
      succ.js { render 'success' }
      fail.js { render 'fail' }
    end
  end
end
