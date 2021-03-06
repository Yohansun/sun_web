# encoding: utf-8
class Users::PasswordsController < Devise::PasswordsController
  prepend_before_filter :require_no_authentication

  # GET /resource/password/new
  def new
    @banners = IBanner.page_name('登录/注册/找回密码').order("position ASC").all
    build_resource({})
  end

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])
    if successfully_sent?(resource)
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    else
      respond_with(resource,reset_password_token: params[:user][:reset_password_token])
    end
  end

  protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      "/users/passwords/send_suc"
    end

end