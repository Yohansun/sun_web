# -*- encoding : utf-8 -*-
class SignUpController < ApplicationController
  before_filter :find_user

  def index
    @user = current_user
  end
  def edit
  	@user = User.find(params[:user])
    @user.password = user.password_confirmation = params[:password]
    @user.save
  end
end