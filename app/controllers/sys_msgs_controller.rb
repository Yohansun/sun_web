# -*- encoding : utf-8 -*-
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
    if SysMsg.destroy(params[:id])
      render :text => "ok"
    else
      render :json => "fail"
    end
  end
end
