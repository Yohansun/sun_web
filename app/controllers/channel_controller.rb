# -*- encoding : utf-8 -*-
class ChannelController < ApplicationController
  #片区快查
  def access

    @design_users = User

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

    if MagicSetting.recommend_designers && !params.keys.include?("keywords" || "area_id" || "user_role")
      @design_users = @design_users.where("id not in (?)", MagicSetting.recommend_designers.split(",") )
    end

    @design_users = @design_users.page(params[:page]).per(10)
  end
end