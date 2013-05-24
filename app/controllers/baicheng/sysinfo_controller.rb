# encoding: utf-8
class Baicheng::SysinfoController < ApplicationController
  layout 'baicheng'
 
  def index
    @msgs = current_user.sys_msgs.baicheng.page(params[:page])
  end

end