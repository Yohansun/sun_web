# -*- encoding : utf-8 -*-
module MagicAdmin
  class UsersController < BaseController
    def index
    	@users = User.select("id, username, name, email, phone, role_id, des_status").page(params[:page]).per(20)
    	if params[:search]
    	   @users = User.search(params)
    	end
    end 
  end
end