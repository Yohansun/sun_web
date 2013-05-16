# encoding: utf-8

class ChannelController < ApplicationController
  #caches_page :index, :expires_in => 60.minutes
  
   #设计快查
  def access
    params[:search] ||= {}
    
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

    #请求添加字段标实 实习和在读设计师
    case params[:user_role]
    when /designer/
      des_status = params[:user_role] == "designer_1"
      params[:search].merge!({:user_role_id_equals => 1,:user_des_status_equals => des_status})
    when /company/
      params[:search].merge!({:user_role_id_equals => 2})
    end
    
    province_id,city_id,area_id = params[:province_id].or(nil),params[:city_id].or(nil),params[:area_id].or(nil)

    if area_id.present?
      params[:search][:area_id_eq] = area_id
    elsif province_id.present?
      params[:search][:user_area_id_in] = Area.robot(province_id,[city_id].compact).map(&:id)
    end
    
    @search = DesignImage.available.users.search(params[:search])
    @design_users = @search.page(params[:page]).per(8)
    
    #mood
    @moods = Mood.order("created_at desc").limit(5)
    
    #每周之星,月度之星 = stars
    stars = WeeklyStar.order("published_at desc").partition {|weekly_star| weekly_star.star_type_id == 1 }
    
    weekly_user_ids,per_month_user_ids = stars.collect {|star| star.map(&:user_id) }.compact.uniq
    
    @designers  = User.weekly_related(1,weekly_user_ids).page(1).per(8)

    @companys   = User.weekly_related(2,per_month_user_ids).page(1).per(16)
  end

  def refresh_service
  end
end