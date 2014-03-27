# -*- encoding : utf-8 -*-
class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  after_filter :cors_set_access_control_headers

  def create_user
    user = User.new
    user.username = params[:username]
    user.password = user.password_confirmation = params[:password]
    user.email = params[:email]
    user.is_read = true
    user.is_from_minisite = true
    user.area_id = params[:area_id] ? params[:area_id] : 31
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

    if user.save(validate: false)
      respond_to do |format|
        format.json {render :json => { :result => 'true',
         :mag => "注册成功!", :uid => '#{user.id}' } }
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
         :mag => "登陆成功!", :uid => "#{user.id}" } }
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

  def update_user
    user = User.find params[:user_id]
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
    if user.save(validate: false)
      respond_to do |format|
        format.json {render :json => { :result => 'true',
         :mag => "注册成功!", :uid => '#{user.id}' } }
      end
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
    end
  end

  def external_login
    session[:api_login] = 'mobile'
    if params[:type] == "weibo"
      redirect_to "/users/auth/weibo"
    end
    if params[:type] == "qq_connect"
      redirect_to "/users/auth/qq_connect"
    end
    if params[:type] == "renren"
      redirect_to "/users/auth/renren"
    end
    if params[:type] == "kaixin"
      redirect_to "/users/auth/kaixin"
    end
  end

  def baicheng_login
    session[:baigcheng_login] = 'baicheng'
    if params[:type] == "weibo"
      redirect_to "/users/auth/weibo"
    end
    if params[:type] == "qq_connect"
      redirect_to "/users/auth/qq_connect"
    end
    if params[:type] == "renren"
      redirect_to "/users/auth/renren"
    end
    if params[:type] == "kaixin"
      redirect_to "/users/auth/kaixin"
    end
  end

  def cubit_fixtures
    fixtue = CubitFixture.new
    fixtue.name = params[:name]
    fixtue.phone = params[:phone]
    fixtue.fixture_area = params[:fixture_area]
    fixtue.style = params[:style]
    fixtue.house_name = params[:house_name]
    fixtue.fixture_type = params[:fixture_type]
    fixtue.area_id = params[:area]
    fixtue.pre_price = params[:pre_price]
    if fixtue.save
      Notifier.cubit_fixture(fixtue.id).deliver
      render text: "<script>alert('申请提交成功! #{params[:name]}')</script>"
    else
      render text: "<script>alert('申请提交失败! #{params[:name]}')</script>"
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin']      = '*'
    headers['Access-Control-Allow-Methods']     = 'POST'
    headers['Access-Control-Max-Age']           = '1728000'
    headers['Access-Control-Allow-Credentials'] = 'true'
  end
end
