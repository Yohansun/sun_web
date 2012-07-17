class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :search_color_code

  def stored_location_for(resource)
    if current_user && current_user.not_role?
      flash[:notice] = "Congratulations, you're signed up!"
      return omniauth_user_user_path(resource)
    end
    super(resource)
  end

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def search_color_code(arg)
    ColorCode.find_by_code(arg)
  end

  def after_sign_out_path_for(resource_or_scope)
    referer = request.headers['referer']

    unless request.base_url.blank?
      if referer =~ %r(#{request.base_url}/users(/\d{1,}/(designs|inspirations)?)?)
        if $1.blank? || $2.blank?
          return "/"
        else          
          referer_link = request.base_url + "/" + $2
          return referer_link
        end
      else  
        return referer  
      end  
    else
      return "/"
    end  
  end

  def load_skin
    user_ids = Skin.find_by_role_id(@user.role_id).try(:user_ids)

    case @user.role_id
      when 2
        if user_ids.present? && user_ids.include?(@user.id.to_s)
          render :template => "users/skins/company/#{@user.designs.blank? ? 'white' : 'white'}/index"
        else
          render :template => "users/#{controller_name}"
        end
      else
        render :template => "users/#{controller_name}"
    end
  end
end