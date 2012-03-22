# -*- Encoding: UTF-8 -*-
class Users::RegisterController < Devise::RegistrationsController
  layout :layout_by_resource

  def create
    @messages = ""
    valid_result = data_valid
    rebuild_params

    if valid_result.size > 0
      valid_result.each do |key, value|
        @messages << "*" + value + '\n'
      end
      return @messages
    elsif valid_result.length == 0 && params[:is_read].nil?
      @messages << "*您还没有接受会员注册协议！" + '\n'
      return @messages
    end

    build_resource

    if resource.save
      if resource.active_for_authentication?
        sign_in(resource_name, resource)
        respond_with resource
      else
        expire_session_data_after_sign_in!
        respond_with resource
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def rebuild_params
    if session[:role]
      params[resource_name][:role_id] = Role.find_by_role(session[:role]).id
    end

    if params[resource_name][:sex]
      case params[resource_name][:sex]
        when '1'
          params[resource_name][:sex] = '男'
        when '0'
          params[resource_name][:sex] = '女'
      end
    end

    #没有推荐人的时候，将recommended_name设置为空
    params[:user][:recommended_name] = '' if params[:user][:recommended] != "1"

    #设计师注册页面‘就职公司’，‘就职地址’，‘在读学校’，‘学校地址’ 字段重置
    if params[:user][:recommended] == "1"
      params[:user][:current_school] = ''
      params[:user][:school_address] = ''
    else
      params[:user][:inauguration_company] = ''
      params[:user][:recipient_address]    = ''
    end
  end

  def data_valid
    regexEnum = { :username => "(?!_)(?![0-9])^[-_a-zA-Z0-9\u4e00-\u9fa5]", #username
                  :password => "^\\d{6,}$", #password
                  :email    => "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", #email
                  :phone    => "^(13|15|18)[0-9]{9}$",
                  :name     => "^[\u4e00-\u9fa5]{2,4}$", #真实姓名 2-4个中文
                  :zip_code => "^\\d{6}$" #邮政编码
    }

    params[:user].each do |key, value|
      #必填选项
      if key =~ /username|password|recipient_address|email|phone|name_of_company|company_address/
        if  value.blank?
          set_flash_message key.to_sym, "#{key}_blank".to_sym
        else
          if !regexEnum[key.to_sym].nil? && value !~ Regexp.new(regexEnum[key.to_sym])
            set_flash_message key.to_sym, "#{key}".to_sym
          end
          if key == 'username' && User.exists?(key.to_sym => value)
            set_flash_message key.to_sym, :username_used
          end
        end
      end

      #真实姓名和邮政编码不为空值时的验证
      if key =~ /name|zip_code/ && !value.blank? && !regexEnum[key.to_sym].nil? && value !~ Regexp.new(regexEnum[key.to_sym])
        set_flash_message key.to_sym, "#{key}".to_sym
      end
    end

    #设计师注册页面‘就职公司’，‘就职地址’，‘在读学校’，‘学校地址’
    if params[:user][:des_status] == "1"
      set_flash_message(:inauguration_company, :inauguration_company_blank) if params[:user][:inauguration_company].blank?
    else
      set_flash_message(:current_school, :current_school_blank) if params[:user][:current_school].blank?
    end

    # 推荐人验证
    if params[:user][:recommended] == "1"
      if params[:user][:recommended_name].blank?
        set_flash_message :recommended_name, :recommended_name_blank
      else
        set_flash_message(:recommended_name, :recommended_name) if !User.exists?(:username => params[:user][:recommended_name])
      end
    end

    if params[:user][:flag]
      render :text => "#{flash.to_hash[:username]}"
    end

    return flash.to_hash
  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      'application'
    end
  end
end

#def search_area(state_id,city_id,district_id)
#  area = []
#  File.open("#{Rails.root}/lib/data/areas.json", 'r') do |file|
#      content = file.readlines.to_s.delete('\\').delete('n')
#      hash = JSON.parse(content)
#  end
#
#end
