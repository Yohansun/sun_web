# encoding: utf-8
class UsersController < ApplicationController
  def me
    redirect_to user_path(current_user)
  end

  def edit_me
    redirect_to edit_user_path(current_user)
  end

  def edit
    @banners = IBanner.page_name('登录/注册/找回密码').order("position ASC").all
  end

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

    if current_user
      valid_result = current_user.errors.messages
      params[:user].delete("recommended")
      current_user.update_detail(params[:user])

      @user = current_user
      @messages = ""

      if valid_result.size != 0
        valid_result.each_pair do |_, value|
          @messages << "*" + value[0] + '\n'
        end

        return @messages
      end
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
      if current_user.save
        if session[:baigcheng_login].present?
          redirect_to baicheng_root_path
        else
          redirect_to(root_path)
        end
      else
        valid_result = current_user.errors.messages

        if valid_result.size != 0
          errors = ""
          valid_result.each_pair do |_, value|
            errors << "*" + value[0] + '\n'
          end

          flash[:errors] = errors
          render :action => "omniauth_user"
        end
      end
    end
  end

  def omniauth_user
  end

  def reset_password
    if params[:reset_psd]
      @user = current_user
      current_user.update_attributes params[:user]

      if current_user.errors.messages.present?
        errors = ""
        current_user.errors.messages[:password].each do |error|
          errors << "*" + error + '\n'
        end
        flash[:errors] = errors
        redirect_to :back
      else
        sign_in(@user, :bypass => true)
        redirect_to user_path(@user)
      end
    end
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