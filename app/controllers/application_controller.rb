# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :search_color_code,:find_or_build_zip_file
  layout "home_manage"

  around_filter :catch_exceptions
  before_filter :authorize_profiler

  def stored_location_for(resource)
    if current_user && current_user.not_role?
      flash[:notice] = "Congratulations, you're signed up!"
      return omniauth_user_user_path(resource)
    end
    super(resource)
  end

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def search_color_code(arg)
    ColorCode.find_by_code(arg)
  end

  def after_sign_out_path_for(resource_or_scope)
    referer = request.headers['referer']

    unless request.base_url.blank?
      if referer =~ %r(#{request.base_url}/users(/\d{1,}/(designs|inspirations)?)?)
        if $1.blank? || $2.blank?
          return "/"
        else
          referer_link = request.base_url + "/" + $2
          return referer_link
        end
      else
        return referer
      end
    else
      return "/"
    end
  end

  def load_skin
    skin = nil
    Skin.find_each do |s|
      skin = s.user_ids.split(",").include?(@user.id.to_s) ? s : nil
    end

    if skin.present?
      session[:skin_type] = skin.skin_type_id

      case skin.skin_type_id
        when 2
          render :template => "users/skins/company/#{@user.designs.blank? ? 'white' : 'black'}/index"
        when 4
          render :template => "users/skins/weekly_star/index"
      end
    else
      if params[:action].eql? "community"
        render :template => "users/community"
      else
        render :template => "users/#{controller_name}"
      end
    end
  end

  #验证第三方的用户信息完整性,否则强制跳转到信息填写页面
  before_filter do
    if current_user && current_user.username.blank? && current_user.user_tokens.present?
      errors = [].tap do |e|
        e << "我的身份" if current_user.role_id.blank?
        e << "联系电话" if current_user.phone.blank?
        e << "Email"   if current_user.email.blank?
      end

      if errors.present?
        skip_filter_actions = [['users','omniauth_user'],['sessions','destroy'],['users','update_user_role']]
        unless skip_filter_actions.include? [controller_name,action_name]
          flash[:errors] = "亲,请您完善" + errors.join(',') + "后再浏览iColor的精彩内容!"
          redirect_to omniauth_user_user_path(current_user)
        end
      end
    end
  end

	#find_or_build_zip_file("tmp/file.zip",:ab_paths => ["/root/pictures/1.jpg",.....],:cache_name => :cache_name)
	#or
	#find_or_build_zip_file("tmp/file.zip",:ab_paths => ["/root/pictures/1.jpg",.....],:cache_name => :cache_name) do |file|
	#  send_file file
	#end
	#
	#记住更新某个相册的时候记住Rails.cache.write(:cache_name,false)
	def find_or_build_zip_file(*vals,&block)
		options = vals.extract_options!
		options.assert_valid_keys(:ab_paths,:cache_name)
		raise "参数不能为空"	if vals.blank?
		raise "没有图片"			if options[:ab_paths].blank?
		zipfile = File.expand_path(vals.shift)

		if Rails.cache.read(options[:cache_name]).blank?
			FileUtils.rm(zipfile) if File.exists?(zipfile)
			%x[zip -j #{zipfile} #{options[:ab_paths].join(" ")}] && Rails.cache.write(options[:cache_name],true)
		end
		block_given? ? yield(zipfile) : zipfile
	end

  # for MiniProfiler
  def authorize_profiler
    if current_user && current_user.is_admin?
      Rack::MiniProfiler.authorize_request
    end
  end

private
  def catch_exceptions
    yield
  rescue StandardError => e
    logger.debug "[----------] #{e.to_s}"
    raise e
  end

end