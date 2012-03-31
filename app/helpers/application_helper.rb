# -*- Encoding: UTF-8 -*-
module ApplicationHelper

  def set_style
    case controller_name
      when "home"
        return { :css => ["style", "index"] }
      when /designer_events|other_events/
        return { :css => ["exciting_activities","style"] }
      when "color_articles"
        return { :css => ["industry_news","style"], :js => ["galleryF"], :pic_path => "/assets/news/title_news.png" }
      when "weekly_stars"
        return { :css => ["weekstar","style"], :js => ["location.js", "LinkageSelect.js"], :pic_path => "/assets/design/title_design.png" }
      when /register|users/
        return { :css => ["reg"], :js => ["location.js", "LinkageSelect.js"] }
      when "passwords"
        return { :css => ["reg"] }
      when /^master|contact/
        return { :css => ["style", "weekstar"], :pic_path => "/assets/master/title_master.png" }
      when "channel"
        return { :css => ["news"], :pic_path => "/assets/news/title_owner.png" }
      when "faqs"
        return { :css => ["news", "owners_channel"], :pic_path => "/assets/news/title_owner.png" }
      when "softwares"
        return { :css => ["news"], :js => ["myfocus"], :pic_path => "/assets/news/title_tools.png" }
      when "designs"
        case action_name
          when "index"
            return { :css => ["style", "/fancybox/jquery.fancybox.css", "/fancybox/helpers/jquery.fancybox-buttons.css"], :js => ["jquery.fancybox.js", "/fancybox/helpers/jquery.fancybox-buttons.js", "jquery.masonry.js"], :pic_path => "/assets/design/title_design.png" }
          else
            return { :css => ["reg"] }
        end
      when "inspirations"
        case action_name
          when "show"
            return { :css => ["weekstar"], :pic_path => "/assets/design/title_design.png" }
          when "upload"
            return { :css => ["reg"] }
          else
            return { :css => ["style"], :js => ["jquery.masonry.js"], :pic_path => "/assets/design/title_design.png" }
        end
      when "events"
        case action_name
          when "index"
            return { :css => ["news"], :pic_path => "/assets/news/title_event.png" }
          when /new|edit/
            return { :css => ["jDatepicker"], :js => ["datepicker_lang_US.js","jquery.datepicker.js"] }
        end
      when "function"
        return { :css => ["reg"] }
      when "industry_news"
        return { :css => ["news"], :pic_path => "/assets/news/title_news.png" }
      when "articles"
        return { :css => ["news", "industry_news"], :pic_path => "/assets/news/title_news.png" }
      when "user"
        return { :css => ["style"], :js => ["jquery.masonry.js"] }
      when "messages"
        return { :css => ["style"], :js => ["jquery.masonry.js"] }
      when "site_messages"
        return { :css => ["reg"], :js => ["jquery.masonry.js"] }
      when "designs"
        return { :js => ["jquery.masonry.js"] }
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
