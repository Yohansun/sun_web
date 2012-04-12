class SysMsgsController < ApplicationController
  before_filter :find_user
  def index
    if @user
      @sys_msgs = @user.sys_msgs.page(params[:page]).per(5)
      render :template => "#{controller_name}/users/#{action_name}"
    else
      @sys_msgs = SysMsg.page(params[:page]) || SysMsg.new
    end
  end

  def show

  end


  def destroy
    @sys_msg = SysMsg.where(params[:id])
    if SysMsg.destroy(@sys_msg)
      render :text => "ok"
    else
      render :json => "fail"
    end
  end
end
