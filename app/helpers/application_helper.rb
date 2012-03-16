# -*- Encoding: UTF-8 -*-
module ApplicationHelper
  def reg_partial
    session[:role] = params[:role] if params[:role]

    if params[:role]
      render :partial => "#{params[:role]}"
    end
  end

  def suc_designer
    case session[:role]
      when 'designer'
        render :text => '进入设计师主页'
      when 'company'
        render :text => '进入家装公司主页'
      when 'user'
        render :text => '进入主页'
    end
  end
end
