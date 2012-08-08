# -*- encoding : utf-8 -*-
class ChannelController < ApplicationController

  #片区快查
  def access

    #我型我秀页面跳转
    if params.has_key? "role"
      params[:role] << ("_" + params[:des_status]) if params[:des_status].present?
      params[:user_role] = params["role"]
    elsif params.has_key? "search"
      params[:keywords] = params[:search]
    elsif params.has_key? "area"
      #家装公司个人主页和我型我秀页面传递过来的params[:area]
      params[:area_id] = params[:area]
    end

    #排序规则：本周之星 -> 往期之星 -> 作品有色号 -> 上传作品数
    unless params[:keywords] == "请输入关键字"
      @design_users = User.where("name like ? or username like ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
    else
      @design_users = User
    end

    unless params[:province_id].blank?
      @design_users = @design_users.where("area_id in (?)", Area.find(params[:province_id]).self_and_descendants)
    end

    unless params[:city_id].blank?
      @design_users = @design_users.where("area_id in (?)",Area.find(params[:city_id]).self_and_descendants)
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
      s = ul.author_url.match(%r(http://www.icolor.com.cn/users/(\d{1,})?)).to_a[1]
      ws << s unless s.blank?
    end

    cons = []
    #本周之星 -> 往期之星
    if !ws.blank? && params[:user_role] != "company"
      cons << "id = #{ws.first} desc"
      ws.delete(ws.first)
      cons << "id in (#{ws.join(",")}) desc"
    elsif params[:user_role] == "company"
      #根据后台基础设置中推荐家装公司的ID进行排序
      # unless MagicSetting.recommend_designers.blank?
      #  cons << "id in (#{MagicSetting.recommend_designers}) desc"
      # end
      #根据iColor经销商平台中的置顶排序
      cons << "is_top desc"
      cons << "top_order asc"
    end
    #输入立邦色号的数量
    cons << "recommend_designer_status desc"
    #上传作品数量
    cons << "designs_count desc"

    @design_users = @design_users.order(cons.join(","))
    @design_users = @design_users.page(params[:page]).per(9)
  end
end