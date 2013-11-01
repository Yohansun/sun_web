# -*- encoding : utf-8 -*-
class Huaxun::SessionsController < Devise::SessionsController
  layout false
  def create
    if current_user && current_user.genre == 'huaxun'
      sign_in(:user, current_user)
      redirect_to homes_path
    else
      redirect_to huaxun_path(sign: false)
    end
  end

  def destroy
    sign_out(current_user)
    redirect_to huaxun_path
  end
end
