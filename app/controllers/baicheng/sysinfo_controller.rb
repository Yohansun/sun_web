# encoding: utf-8
class Baicheng::SysinfoController < ApplicationController
  layout 'baicheng'
 
  def index
    if current_user
      @msgs = current_user.sys_msgs.baicheng.baicheng_order.order('status asc, created_at desc').page(params[:page])
    else
      redirect_to baicheng_root_path
    end
   
  end
  def show
    @msg =  current_user.sys_msgs.baicheng.find(params[:id])
    @msg.read
    redirect_to   @msg.re_url || root_path
  end
end