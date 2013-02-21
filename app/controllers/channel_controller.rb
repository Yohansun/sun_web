# -*- encoding : utf-8 -*-
class ChannelController < ApplicationController

  #设计快查
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

    ws = [].tap do |w|
      WeeklyStar.order("published_at desc").limit(5).map(&:author_url).each do |ul|
        s = ul.match(%r(http://www.icolor.com.cn/users/(\d{1,})?)).to_a[1]
        w << s unless s.blank?
      end
    end

    if params[:user_role].blank?
      @design_users = @design_users.order("find_in_set(id,'#{ws.reverse.join(",")}') desc").order("current_sign_in_at desc")
    elsif params[:user_role].match /designer/
      @design_users = @design_users.order("current_sign_in_at desc")
    elsif params[:user_role].match /company/
      sellers = @design_users.where("top_order != 0").order("top_order desc").limit(10).map(&:id)

      unless sellers.blank?
        @design_users = @design_users.order("find_in_set(id,'#{sellers.reverse.join(",")}') desc").order("current_sign_in_at desc")
      else
        @design_users = @design_users.order("current_sign_in_at desc")
      end
    end

    @design_users = @design_users.page(params[:page]).per(8)

    #mood
    @moods = Mood.order("created_at desc").limit(5)

    user_ids = []
    WeeklyStar.order("id desc").limit(10).map(&:author_url).each do |ul|
      user_ids << ul.split("/")[-2].to_i
    end
    @users = User.where(id: user_ids).reverse
  end
end