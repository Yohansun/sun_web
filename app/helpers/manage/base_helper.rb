# encoding: utf-8
module Manage::BaseHelper

	def nav_path
		c_name = case controller_name
      when /home_kvs|home_recommends|home_life_videos|questions|home_image_lib|home_design_show|owner_enter|fit_images|home_banners|fit_literals/
      	'home'
      when /channel_tips/
      	'channel_tips'
      when /banner_group|banner_home|banner_channel|banner_refresh|banner_company|banner_images|special_kv/
      	'banner'
      when /tag_sorts|home_heads|seo_sites|home_liter_heads|home_image_lists|home_types|home_spaces|home_colors|home_costs|home_styles/
        'design_images'
      when /life_memoirs|life_info/
        'life'
      else
      	'nothing'
    end
    "manage/base/#{c_name}"
  end

  def refresh_label_path
    label_name = case params[:page_name]
      when '刷新实录'
        'refresh_label1'
      when '刷新实录视频页'
        'refresh_label2'
      when '刷新生活精彩资讯'
        'refresh_label3'
      when '刷新效果'
        'refresh_label4'
      when '刷新服务'
        'refresh_label5'
      else
        'nothing'
    end
    "manage/banner_refresh/#{label_name}"
  end

  def images_label_path
    label_name = case params[:page_name]
      when '图库首页'
        'images_label1'
      when '图库列表页'
        'images_label2'
      when '图库内页'
        'images_label3'
      else
        'nothing'
    end
    "manage/banner_images/#{label_name}"
  end

  def company_label_path
    label_name = case params[:page_name]
      when '华浔品味装饰'
        'company_label1'
      else
        'nothing'
    end
    "manage/banner_company/#{label_name}"
  end

  def left_menu_active key
    flag = case controller_name
      when (key =~ /home/) && /home_kvs|home_recommends|home_life_videos|questions|home_image_lib|home_design_show|owner_enter|fit_images|home_banners|fit_literals|home_image_lists|home_types|home_spaces|home_colors|home_costs|home_styles/
        'on'
      when (key =~ /channel_tips/) && /channel_tips/
        'on'
      when (key =~ /banner/) && /banner_group|banner_home|banner_channel|special_kv/
        'on'
      when (key =~ /life/) && /life_memoirs|life_info/
        'on'
      when (key =~ /column/) && /universal_column/
        'on'
      else
        'off'
    end
    flag
  end

end
