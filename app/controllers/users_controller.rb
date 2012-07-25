class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    if user.role_name == "user"
      redirect_to user_inspirations_path(params[:id])
    else
      redirect_to user_designs_path(params[:id])
    end
  end

  def update
    if params[:user][:recommended] == "1" && !params[:user][:recommended_name].blank?
      id = User.find_by_username(params[:user][:recommended_name])
      user = User.find_by_username(params[:user][:recommended_name])
      params[:user][:recommended_id] = user.id unless user.blank?
    else
       params[:user][:recommended_id] = ""
    end

    if params[:is_upadte_psd].eql? "0"
      params[:user].delete_if {|key,value| key =~ /password/}
    end

    if current_user
      valid_result = current_user.errors.messages
      params[:user].delete("recommended")
      current_user.update_detail(params[:user])

      @user = current_user
      @messages = ""

      if valid_result.size != 0
        valid_result.each do |key, value|
          @messages << "*" + value[0] + '\n'
        end
      else
        # Sign in the user by passing validation in case his password changed
        sign_in(@user, :bypass => true) if params[:is_upadte_psd].eql? "1"
      end

      return @messages
    end
  end

  def update_user_signature
    if params[:id]
      user = User.find(params[:id])
      user.signature = params[:value]
      if user.save
        render :text => user.signature
      end
    end
  end

  def update_user_role
    if current_user
      if params[:user][:user_role] =~ /designer/
        params[:user][:role_id] = Role.find_by_role("designer").id
        params[:user][:des_status] = params[:user][:user_role] == "designer_1"
      else
        if params[:user][:user_role].blank?
          params[:user][:user_role] = 'user'
        end
        params[:user][:role_id] = Role.find_by_role(params[:user][:user_role]).id
      end

      current_user.attributes = params[:user]
      if current_user.save(:validate => false)
        redirect_to(root_path)
      else
        render :action => "omniauth_user"
      end
    end
  end

  def omniauth_user

  end

  def community
    @user = User.find(params[:user_id]) if params[:user_id]
    @providers = @user.user_tokens.map {|u| u.provider if u.is_binding?}

    load_skin 
  end

  def binding_cancel
    if params[:community]
      current_user.user_tokens.find_by_provider(params[:community]).update_attribute :is_binding, false
      redirect_to user_community_path(current_user)
    end
  end
end