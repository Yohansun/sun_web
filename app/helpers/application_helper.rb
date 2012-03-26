# -*- Encoding: UTF-8 -*-
module ApplicationHelper
  def reg_partial
    session[:role] = params[:role] if params[:role]

    if params[:role]
      render :partial => "#{params[:role]}"
    end
  end

  def suc_designer
    case session[:role]
      when 'designer'
        render :text => '进入设计师主页'
      when 'company'
        render :text => '进入家装公司主页'
      when 'user'
        render :text => '进入主页'
    end
  end

  def set_style
    case controller_name
      when /designer_events|other_events/
        return { :css => ["index", "exciting_activities"] }
      when "color_articles"
        return { :css => ["index", "industry_news"], :js => ["galleryF"], :pic_path => "/assets/news/title_news.png" }
      when "weekly_stars"
        return { :css => ["index", "weekstar"], :js => ["location.js", "LinkageSelect.js"], :pic_path => "/assets/design/title_design.png" }
      when "register"
        return { :css => ["reg"], :js => ["location.js", "LinkageSelect.js"] }
      when /^master|contact/
        return { :css => ["style", "weekstar"], :pic_path => "/assets/master/title_master.png" }
      when "channel"
        return { :css => ["news"], :pic_path => "/assets/news/title_owner.png" }
      when "faqs"
        return { :css => ["news", "owners_channel"], :pic_path => "/assets/news/title_owner.png" }
      when "softwares"
        return { :css => ["news"], :js => ["myfocus"], :pic_path => "/assets/news/title_tools.png" }
      when "designs"
        return { :css => ["style", "/fancybox/jquery.fancybox.css", "/fancybox/helpers/jquery.fancybox-buttons.css"], :js => ["jquery.fancybox.js", "/fancybox/helpers/jquery.fancybox-buttons.js", "jquery.masonry.js"], :pic_path => "/assets/design/title_design.png" }
      when "inspirations"
        case action_name
          when "show"
            return { :css => ["index", "weekstar"], :pic_path => "/assets/design/title_design.png" }
          else
            return { :css => ["style"], :js => ["jquery.masonry.js"], :pic_path => "/assets/design/title_design.png" }
        end
      when "events"
        return { :css => ["news"], :pic_path => "/assets/news/title_event.png" }
      when "function"
        return { :css => ["reg"] }
      when "industry_news"
        return { :css => ["news"], :pic_path => "/assets/news/title_news.png" }
      when "articles"
        return { :css => ["news", "industry_news"], :pic_path => "/assets/news/title_news.png" }
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

end
