# encoding: utf-8

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

    if params[:keywords].present?
      @design_users = User.where("name like ? or username like ?", "%#{params[:keywords]}%", "%#{params[:keywords]}%")
    else
      @design_users = User
    end

    unless params[:province_id].blank?
      @design_users = @design_users.where("users.area_id in (?)", Area.find(params[:province_id]).self_and_descendants)
    end

    unless params[:city_id].blank?
      @design_users = @design_users.where("users.area_id in (?)",Area.find(params[:city_id]).self_and_descendants)
    end

    unless params[:area_id].blank?
       @design_users = @design_users.where(:area_id => params[:area_id])
    end

    case params[:user_role]
    when /designer/
      des_status = params[:user_role] == "designer_1"
      @design_users = @design_users.where(:des_status => des_status ).order("current_sign_in_at desc")
    when /company/
      @design_users = @design_users.where(:role_id => Role.find_by_role("company").id)        
      sellers = @design_users.where("top_order != 0").order("top_order desc").limit(10).map(&:id)

      unless sellers.blank?
        @design_users = @design_users.order("find_in_set(users.id,'#{sellers.reverse.join(",")}') desc").order("current_sign_in_at desc")
      else
        @design_users = @design_users.order("current_sign_in_at desc")
      end
    end

    #use abacus
    #@design_users = @design_users.select("users.*, count(design_images.id) as design_image_count").joins(:designs).joins("left join design_images on design_images.imageable_id = designs.id and `design_images`.`imageable_type` = 'Design'").group("users.id").having("design_image_count > 0").abacus.page(params[:page]).per(8)
    @design_users = @design_users.joins(:design_images).
                                  where(:design_images => {:imageable_type => 'Design'}).
                                  group("users.id").order("design_images.created_at desc").abacus.
                                  page(params[:page]).per(8)

    #mood
    @moods = Mood.order("created_at desc").limit(5)

    #design_star
    design_user_ids = []
    WeeklyStar.order("id desc").map(&:author_url).each do |ul|
      design_user_ids << ul.split("/")[-2].to_i
    end
    list_design_users = User.where(id: design_user_ids, role_id: 1).order("find_in_set(users.id,'#{design_user_ids.join(",")}') asc").limit(8)

    # @xiaofei: 必须重构这些代码
    @list_design_users1 = list_design_users.page(1).per(2)
    @list_design_users2 = list_design_users.page(2).per(2)
    @list_design_users3 = list_design_users.page(3).per(2)
    @list_design_users4 = list_design_users.page(4).per(2)

    #company_star
    list_company_users = User.where(id: design_user_ids, role_id: 2).order("find_in_set(users.id,'#{design_user_ids.join(",")}') asc").limit(16)
    @list_company_users1 = list_company_users.page(1).per(4)
    @list_company_users2 = list_company_users.page(2).per(4)
    @list_company_users3 = list_company_users.page(3).per(4)
    @list_company_users4 = list_company_users.page(4).per(4)

    @star_list_counter = [list_design_users.size/2.0, list_company_users.size/4.0].min.ceil

    user_ids = []
    WeeklyStar.order("id desc").limit(10).map(&:author_url).each do |ul|
      user_ids << ul.split("/")[-2].to_i
    end
    @users = User.where(id: user_ids).reverse
  end
end