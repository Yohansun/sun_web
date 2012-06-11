# -*- encoding : utf-8 -*-
class ChannelController < ApplicationController

  #片区快查
  def access
    #排序规则：先每周之星，次作品有色号，后上传作品数
    unless params[:keywords] == "请输入关键字"
      @design_users = User.where("name like ? or username like ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
    else
      @design_users = User
    end

    unless params[:province_id].blank?
      areas = []
      Area.find(params[:province_id]).leaves.map{|a| areas << a.id}
      @design_users = @design_users.where("area_id in (#{areas.join(",")})")
    end

    unless params[:city_id].blank?
      areas = []
      Area.find(params[:city_id]).children.map{|a| areas << a.id}
      @design_users = @design_users.where("area_id in (#{areas.join(",")})")      
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

    user_url = WeeklyStar.order("published_at desc").select("author_url")
    ws = []
    user_url.each do |ul|
      s = ul.author_url.match(%r(http://www.icolor.com.cn/users/(\d{1,5})?)).to_a[1]
      ws << s unless s.blank?
    end
    cons = []
    week_now = user_url.first.author_url.match(%r(http://www.icolor.com.cn/users/(\d{1,5})?)).to_a[1]
    unless @design_users.where("id = (#{week_now})").blank?
      cons << "id = (#{week_now}) desc"
    else
      cons << "id in (#{ws.join(",")}) desc"
    end

    cons << "recommend_designer_status desc"
    cons << "designs_count desc"
    @design_users = @design_users.order(cons.join(","))
    @design_users = @design_users.page(params[:page]).per(9)
  end
end