#encoding: utf-8
module ApplicationHelper
  def forward_links(title, url = '', pic = '', id, type)
    uri_title = URI.encode(title)
    unless pic.nil?
      if type =~ %r(MasterInterview|MasterDesign)
        raw '<span style="height:18px;position:absolute; left:-178px; background-color:none;">
              一键转发：
              <span class="popup_zf2 group" style="background:#fff;bottom:-4px;*bottom:-5px!important; left:70px;width:90px;border:0;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'" >
                <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
                <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
                <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
                <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
              </span>
            </span>'
      elsif type =~ %r(Mood|WeeklyStar)
        raw '<span class="popup_zf group none" style="bottom:-6px;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'">
              <span style="color:#000;padding:0 5px!important;">一键转发：</span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      else
        raw '<span data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'" class="popup_zf group none" style="background:white;">
              <span style="background:white;padding:0; margin:0; line-height:14px;">
                一键转发：
              </span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      end
    else
      if type =~ %r(MasterInterview|MasterDesign)
        raw '<span style="height:18px;position:absolute; left:-178px; background-color:none;">
                一键转发：
                <span class="popup_zf2 group" style="background:#fff;bottom:-4px;*bottom:-5px!important; left:70px;width:90px;border:0;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" >
                  <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
                  <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
                  <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
                  <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
                </span>
              </span>'
      elsif type =~ %r(Mood|WeeklyStar)
        raw '<span class="popup_zf group none" style="bottom:-6px;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'">
              <span style="color:#000;padding:0 5px!important;">一键转发：</span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      else
        raw '<span data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" class="popup_zf group none" style="background:white;">
              <span style="background:white; padding:0; margin:0; line-height:14px;">
              一键转发：
              </span>
              <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
              <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
              <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
              <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
            </span>'
      end
    end
  end


  def set_style
    @set_style ||= set_style_value
  end

  def set_style_value
    case controller_name
      when "color_articles"
        return { :pic_path => "/assets/news/title_news.png" }
      when /^master|contact/
        return { :pic_path => "/assets/master/title_master.png" }
      when "channel"
        return { :pic_path => "/assets/news/title_owner.png" }
      when "faqs"
        return { :pic_path => "/assets/news/title_owner.png" }
      when "softwares"
        return { :pic_path => "/assets/news/title_tools.png" }
      when "designs"
        case action_name
          when "index"
            return { :pic_path => "/assets/design/title_design.png" }
        end
      when "inspirations"
        case action_name
          when "show"
            return { :pic_path => "/assets/design/title_design.png" }
          else
            return { :pic_path => "/assets/design/title_design.png" }
        end
      when "industry_news"
        return { :pic_path => "/assets/news/title_news.png" }
      when "articles"
        return { :pic_path => "/assets/news/title_news.png" }
    end
  end

  #Display a custom sign_in form anywhere in your app

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def color_master_image
    if params[:type] == "color"
      url = "master/color_master_hover.png"
    else
      url = "master/color_master_btn.png"
    end
    url
  end

  def space_master_image
    if params[:type] == "shinei"
      url = "master/space_master_hover.png"
    else
      url = "master/space_master_btn.png"
    end
    url
  end

  def show_avatar(*args)
    user, type, size = args[0], args[1], args[2]
    if user.avatar.present?
      link_to image_tag("#{user.avatar.file.url(type.blank? ? :original : type.to_sym)}", size: "#{size if size.present?}"), user_path(user)
    else
      link_to image_tag(asset_path("news/regimg_bg.jpg"), size: "#{size if size.present?}"), user_path(user)
    end
  end

  def avatar_img(*args)
    user, type, size = args[0], args[1], args[2]
    if user.avatar.present?
       image_tag("#{user.avatar.file.url(type.blank? ? :original : type.to_sym)}", size: "#{size if size.present?}")
    else
       image_tag(asset_path("news/regimg_bg.jpg"), size: "#{size if size.present?}")
    end
  end

  #家装公司个性主页helper
  #获取最新的行业资讯
  def get_articles
    Subject.content("articles")
  end

  #获取公司推荐设计师
  def get_recommended_designer
    User.select("id,username,name,role_id,inauguration_company").where(:role_id => 1, :inauguration_company => @user.display_name).limit 4
  end

  def get_designs
    @user.designs.map {|design| design.design_images}.flatten! || []
  end

  def get_skin_kvs
    if (skin = Skin.find_by_skin_type_id(session[:skin_type])).present?
      skin.skin_kv_uploads
    end
  end

  def get_weekly_stars
    user_urls = WeeklyStar.order("published_at desc").select("author_url").limit 5
    ws = []
    user_urls.each do |ul|
      s = ul.author_url.match(%r(http://www.icolor.com.cn/users/(\d{1,})?)).to_a[1]
      ws << User.select("id,username,name").find(s) unless s.blank?
    end
    ws
  end

  #/national_day 活动一：火眼金睛寻宝图（10.1开始每天10.01分更新图片）
  def get_pic
    # pic_urls = %w(http://www.icolor.com.cn/users/65668/designs/2605
    #               http://www.icolor.com.cn/users/63178/designs/1822
    #               http://www.icolor.com.cn/inspirations/1088
    #               http://www.icolor.com.cn/color_designs/467
    #               http://www.icolor.com.cn/users/64528/designs/1906
    #               http://www.icolor.com.cn/users/65637/designs/2250
    #               http://www.icolor.com.cn/users/66071/designs/2473)

    month,day,time,hour = Time.now.month, Time.now.day, Time.now, Time.now.hour

    if month < 10 || (month == 10 && day ==1 && hour < 10)
      return image_tag(asset_path("october/october_img.jpg"))
    elsif month == 10 && (1..7).include?(day)
      if hour >= 10
        image_tag(asset_path("october/#{day}.jpg")) #, pic_urls[day-1]
      else
        image_tag(asset_path("october/#{day-1}.jpg")) #, pic_urls[day-2]
      end
    end
  end

  def link_suffix
    "#from=top"
  end

  def footer_links
    c_name = case controller_name
    when /design_images/
      'design_images_links'
    else
      'default_links'
    end
    "layouts/footer_links/#{c_name}"
  end

  # TASK290
  ALLOW_CONVERSION = Hash.new {|k,v| k[v] = []}.tap do |hash|
    hash[:home]          = [:index];
    hash[:design_images] = [:index]
    hash[:channel]       = [:access]
  end

  def rendered_script_conversion
    ctrl,act = params[:controller],params[:action]
    path_url = "conversion/#{ctrl}_#{act}"
    render(path_url) if allow_conversion(ctrl,act)
  end

  def allow_conversion(ctrl,act)
    ctrl,act = ctrl.to_sym,act.to_sym
    ALLOW_CONVERSION[ctrl].tap do |actions|
      return actions.include?(act)
    end
  end
end