# -*- encoding : utf-8 -*-
class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create_user
    user = User.new
    user.username = params[:username]
    user.password = user.password_confirmation = params[:password]
    user.email = params[:email]
    user.is_read = true
    user.is_from_minisite = true
    user.area_id = params[:area_id] if params[:area_id]
    user.phone = params[:phone]
    #user.role_id = Role.find_by_role(params[:role]).id
    case params[:role]
    when "designer1"
      user.role_id = 1
      user.des_status = 1
    when "designer0"
      user.role_id = 1
      user.des_status = 0
    when "company"
      user.role_id = 2 
    when "user"
      user.role_id = 3
    end
      
    if user.save
      respond_to do |format|
        format.json {render :json => { :result => 'true',
         :mag => "注册成功!" } }
      end
      #render :text => '<results suc="true" msg=""/>'
    else
      messages = ''
      valid_result = user.errors.messages
      if valid_result.size > 0
        valid_result.each do |_, value|
          messages << value[0]
        end
      end
      respond_to do |format|
        format.json {render :json => { :result => 'false',
         :mag =>"#{messages}" } }
      end
      #render :text => "<results suc='false' msg='#{messages}'/>"
    end
  end

  def login
    user = User.find_for_database_authentication(:login => params[:username])
    if user && user.valid_password?(params[:password])
      respond_to do |format|
        format.json {render :json => { :result => 'true',
         :mag => "登陆成功!" } }
      end
      #render :text => '<results suc="true" msg=""/>'
    else
      respond_to do |format|
        format.json {render :json => { :result => 'false',
         :mag => "用户名或密码错误!" } }
      end
      #render :text => '<results suc="false" msg=""/>'
    end
  end
end
