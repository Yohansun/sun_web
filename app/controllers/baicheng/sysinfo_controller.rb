# encoding: utf-8
class Baicheng::SysinfoController < ApplicationController
  layout 'baicheng'
 
  def index
    @msgs = current_user.sys_msgs.unscoped.baicheng.baicheng_order.order('status asc, created_at desc').page(params[:page])
  end
  def show
    @msg =  current_user.sys_msgs.baicheng.find(params[:id])
    @msg.read
    redirect_to   @msg.re_url || root_path
  end
end