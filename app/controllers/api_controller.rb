# -*- encoding : utf-8 -*-
class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create_user
    user = User.new
    user.username = params[:username]
    user.password = user.password_confirmation = params[:password]
    user.email = params[:email]
    user.is_read = true
    user.role_id = Role.find_by_role(params[:role]).id
    if user.save
      render :text => '<results suc="true" msg=""/>'
    else
      messages = ''
      valid_result = user.errors.messages
      if valid_result.size > 0
        valid_result.each do |_, value|
          messages << value[0] + ','
        end
      end
      render :text => "<results suc='false' msg='#{messages}'/>"
    end
  end

  def login
    user = User.find_for_database_authentication(:login => params[:username])
    if user && user.valid_password?(params[:password])
      render :text => '<results suc="true" msg=""/>'
    else
      render :text => '<results suc="false" msg="用户名或密码错误"/>'
    end
  end
end
