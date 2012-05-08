# -*- encoding : utf-8 -*-
class ChannelController < ApplicationController
  helper_method :show_search_result?

  #片区快查
  def access
    #TODO 推荐作品上传完成后回来做根据色号排序
    @design_users = User.order("recommend_designer_status desc").order("designs_count desc")

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