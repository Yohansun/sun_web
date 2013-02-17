# -*- encoding : utf-8 -*-
class SignUpController < ApplicationController
  before_filter :find_user

  def index
    @user = current_user
  end
  def update
  	@user = User.find(params[:user_id])
    @user.password = @user.password_confirmation = params[:user][:password]
    @user.save
    redirect_to edit_user_path(@user)
  end
end