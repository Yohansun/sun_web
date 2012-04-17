# -*- Encoding: UTF-8 -*-
module ApplicationHelper
  def forward_links(title, url = '', pic = '')
    raw '<span data-title="'+title+'" data-url="'+url+'" data-pic="http://'+request.host_with_port + pic+'" class="popup_zf group none" style="bottom:35px;left:0px;"><span>一键转发：</span><a data-webid="qzone" class="popup_zf_qq" href="javascript:void();"></a><a data-webid="tsina" class="popup_zf_sina" href="javascript:void();"></a><a data-webid="renren" class="popup_zf_rr" href="javascript:void();"></a><a class="popup_zf_kaixin" data-webid="kaixin001" href="javascript:void();"></a></span>'
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
end
