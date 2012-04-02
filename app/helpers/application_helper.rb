# -*- Encoding: UTF-8 -*-
module ApplicationHelper

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

end
