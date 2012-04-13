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
    if current_user
      valid_result = current_user.errors.messages
      current_user.update_attributes(params[:user])

      @messages = ""
      if valid_result.size != 0
        valid_result.each do |key, value|
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
      debugger
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
end