# -*- Encoding: UTF-8 -*-
class Users::RegisterController < Devise::RegistrationsController
  layout :layout_by_resource

  def create
    rebuild_params
    build_resource

    if data_valid.size > 0
      @messages = ""
      data_valid.each do |key, value|
        @messages << "<p>" + value + "</p>"
      end
      return @messages
    end

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
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
  end

  def data_valid
    regexEnum = {:email => "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", #email
                 :phone => "^(13|15|18)[0-9]{9}$",
                 :name => "^[\u4e00-\u9fa5]{2,4}$", #真实姓名 2-4个中文
                 :zip_code => "^\\d{6}$" #邮政编码
    }

    params[:user].each do |key, value|
      #必填选项
      if key =~ /inauguration_company|recipient_address|recommended_name|email|phone|name_of_company|company_address/
        if  value.blank?
          set_flash_message key.to_sym, "#{key}_blank".to_sym
        else
          if !regexEnum[key.to_sym].nil? && value !~ Regexp.new(regexEnum[key.to_sym])
            set_flash_message key.to_sym, "#{key}".to_sym
          end
          if (key == 'recommended_name' && !User.exists?(key.to_sym => value))
            set_flash_message key.to_sym, "#{key}".to_sym
          end
        end
      end

      #真实姓名和邮政编码不为空值时的验证
      if key =~ /name|zip_code/ && !value.blank? && value !~ Regexp.new(regexEnum[key.to_sym])
        set_flash_message key.to_sym, "#{key}".to_sym
      end


      unless session[:role] == "designer"
        flash.to_hash.delete(/^inauguration_company/)
        flash.to_hash.delete(/^recipient_address/)
      end

      unless session[:role] == "user"
        flash.to_hash.delete(/^recipient_address/)
      end

      unless session[:role] == "company"
        flash.to_hash.delete(/^name_of_company/)
        flash.to_hash.delete(/^company_address/)
      end
    end

    return  flash.to_hash
  end

  def username_check
    check = Regexp.new('(?!_)(?![0-9])^[-_a-zA-Z0-9\u4e00-\u9fa5]')
    if params[:username] =~ check
      if User.exists?(:username => params[:username])
        render :text => "该用户名已经被注册，请输入新的用户名！"
      else
        render :text => "恭喜您，该用户名尚未被注册！"
      end
    else
      render :text => "用户名不能为空，只能用数字、字母、下划线和汉字组成，不能包含空格，并且不能以下划线和数字开头！"
    end
  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      'application'
    end
  end

  def after_sign_up_path_for(resource)
    users_suc_regist_path
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
