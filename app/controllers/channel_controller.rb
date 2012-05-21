# -*- encoding : utf-8 -*-
class ChannelController < ApplicationController

  #片区快查
  def access
    #排序规则：先每周之星，次作品有色号，后上传作品数
    user_url = WeeklyStar.order("published_at desc").select("author_url")
    ws = []
    user_url.each do |ul|
      s = ul.author_url.match(%r(http://www.icolor.com.cn/users/(\d{1,5})?)).to_a[1]
      ws << s unless s.blank?
    end
    cons = []
    week_now = user_url.first.author_url.match(%r(http://www.icolor.com.cn/users/(\d{1,5})?)).to_a[1]
    cons << "id = (#{week_now}) desc"
    cons << "id in (#{ws.join(",")}) desc"
    cons << "recommend_designer_status desc"
    cons << "designs_count desc"
    @design_users = User.order(cons.join(","))
    unless params[:keywords] == "请输入关键字"
      @design_users = @design_users.where("name like ? or username like ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
    end

    unless params[:area_id].blank?
       @design_users = @design_users.where(:area_id => params[:area_id])
    end

    case params[:user_role]
      when /designer/
        des_status = params[:user_role] == "designer_1"
        @design_users = @design_users.where(:des_status => des_status )
      when "company"
        @design_users = @design_users.where(:role_id => Role.find_by_role("company").id)
    end
    @design_users = @design_users.page(params[:page]).per(9)
  end
end