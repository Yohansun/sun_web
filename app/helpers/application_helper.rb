# -*- Encoding: UTF-8 -*-
module ApplicationHelper

  BASE_TITLE = "立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"

  PAGE_TITLE = { "master_interviews" => "设计大师访谈",
                 "master_topics"     => "热点装修话题",
                 "master_designs"    => "大师作品",
                 "weekly_stars"      => "每周之星",
                 "designs"           => "推荐装修作品",
                 "inspirations"      => "装修灵感秀",
                 "color_designs"     => "色彩配搭",
                 "articles"          => "装修资讯",
                 "color_articles"    => "色彩资讯",
                 "function"          => { "weibo_wall" => "微博资讯", "7-1" => "木纹风尚生活", "7-2" => "墙面艺术效果", "7-3" => "刷新灵感我绘我家", "rules" => "会员机制" },
                 "events"            => "年度色彩趋势活动",
                 "designer_events"   => { "index" => "设计师活动", "city" => "设计师活动", "kv" => "设计师活动" },
                 "other_events"      => { "index" =>"其他精彩活动", "kv" => "其他精彩活动" },
                 "softwares"         => { "tools" => "在线配色软件", "app" => "设计师APP", "case" => "色彩搭配案例" },
                 "channel"           => { "access" => "片区快查" },
                 "faqs"              => "家装设计咨询",
                 "mix_colors"        => { "new" => "在线配色服务" },
                 "register"          => "注册",
                 "users"             => { "edit" => "修改账户信息", "omniauth_user" => "完善个人信息" }
  }

  INNER_PAGE_TITLE = { "events"       => { "index" => "活动公告", "my_event" => "我报名的活动" },
                       "designs"      => "作品",
                       "inspirations" => "灵感秀",
                       "messages"     => "留言板",
                       "rank"         => "我的积分",
                       "sys_msgs"     => "系统消息",
                       "faqs"         => "我的提问",
                       "register"     => "完善个人信息"
  }

  def page_title
    return BASE_TITLE if current_page?(controller:"home")

    begin
      title = @user.nil? ? PAGE_TITLE : INNER_PAGE_TITLE

      unless title[controller_name.to_s][action_name.to_s].blank?
        title[controller_name.to_s][action_name.to_s] + "-" + BASE_TITLE
      else
        title[controller_name.to_s] + "-" + BASE_TITLE
      end
    rescue
      BASE_TITLE
    end
  end

  def des_content
    "立邦 iColor 装修设计世界级大师访谈，大师设计作品与专业设计作品欣赏，为你带来更多装修灵感。以及专业的家装资讯、行业红人资讯解读，更有家装专业实用工具，满足你的色彩家装需求。"
  end

  def keyword_content
    "iColor,立邦,装修设计,设计师"
  end

  def forward_links(title, url = '', pic = '', id, type)
    uri_title = URI.encode(title)
    unless pic.nil?
      if type =~ %r(WeeklyStar|MasterInterview|MasterDesign)
        raw '<span style="height:18px;position:absolute; left:-178px; background-color:none;">
              一键转发：
              <span class="popup_zf2 group" style="background:#fff;bottom:-4px;*bottom:-5px!important; left:70px;width:90px;border:0;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'" >
                <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
                <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
                <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
                <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
              </span>
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
      if type =~ %r(WeeklyStar|MasterInterview|MasterDesign)
        raw '<span style="height:18px;position:absolute; left:-178px; background-color:none;">
                一键转发：
                <span class="popup_zf2 group" style="background:#fff;bottom:-4px;*bottom:-5px!important; left:70px;width:90px;border:0;" data-type="'+type+'" data-id="'+id+'" data-title="'+uri_title+'" data-url="'+url+'" >
                  <a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a>
                  <a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a>
                  <a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a>
                  <a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a>
                </span>
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
    if params[:master_kind] == "色彩大师"
      url = "master/color_master_hover.png"
    else
      url = "master/color_master_btn.png"
    end
    url
  end

  def space_master_image
    if params[:master_kind] == "室内空间大师"
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
      image_tag asset_path("news/regimg_bg.jpg"), size: "#{size if size.present?}"
    end
  end
end