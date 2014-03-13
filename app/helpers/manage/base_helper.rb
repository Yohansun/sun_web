# encoding: utf-8
module Manage::BaseHelper

  def manage_logo
    case controller_name
    when /channel_tips/ then '2013新版Icolor 业主通道'
    when /minisite_counters/ then '2014 Icolor为爱刷新Minisite维护系统'
    else "2013新版icolor"
    end
  end

	def nav_path
		c_name = case controller_name
      when /home_kvs|home_recommends|home_life_videos|questions|home_image_lib|home_design_show|owner_enter|fit_images|home_banners|fit_literals/
      	'home'
      when /channel_tips/
      	'channel_tips'
      when /banner_group|banner_home|banner_channel|banner_refresh|banner_activities|banner_company|banner_images|banner_weekly_stars|banner_other_pages|banner2014minisite|special_kv/
      	'banner'
      when /tag_sorts|home_heads|seo_sites|home_liter_heads|home_image_lists|home_types|home_spaces|home_colors|home_costs|home_styles/
        'design_images'
      when /life_memoirs|life_info/
        'life'
      when /designer_events|other_events|event_kvs/
        'designer_events'
      when /minisite_counters/
        'minisite_counters'
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
      when /徐静蕾的书香客厅/
        'refresh_label6'
      when /王络丹-让爱自由互动/
        'refresh_label7'
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

  def weekly_stars_label_path
    label_name = case params[:page_name]
      when '设计之星'
        'weekly_stars_label1'
      when '作品展示'
        'weekly_stars_label2'
      when '色彩配搭'
        'weekly_stars_label3'
      when '设计之星内页'
        'weekly_stars_label4'
      when '作品展示内页'
        'weekly_stars_label4'
      when '色彩配搭内页'
        'weekly_stars_label4'
      else
        'nothing'
    end
    "manage/banner_weekly_stars/#{label_name}"
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

  def activities_label_path
    label_name = case params[:page_name]
      when '活动集锦'
        'activities_label1'
      when '其它活动'
        'activities_label2'
      when '活动集锦内页'
        'activities_label3'
      when '其它活动内页'
        'activities_label4'
      when '因爱设计师获奖名单'
        'activities_label5'
      when '获奖名单'
        'activities_label6'
      else
        'nothing'
    end
    "manage/banner_activities/#{label_name}"
  end

  def other_pages_label_path
    label_name = case params[:page_name]
      when '登录/注册/找回密码'
        'other_pages_label1'
      when '作品上传'
        'other_pages_label2'
      else
        'nothing'
    end
    "manage/banner_other_pages/#{label_name}"
  end

  def minisite_label_path
    label_name = case params[:page_name]
      when '爱的故事'
        'minisite_label1'
      when '设计作品展示'
        'minisite_label2'
      when '设计师精选-iColor设计之星'
        'minisite_label3'
      else
        'nothing'
    end
    "manage/banner2014minisite/#{label_name}"
  end

  def left_menu_active key
    flag = case controller_name
      when (key =~ /home/) && /home_kvs|home_recommends|home_life_videos|questions|home_image_lib|home_design_show|owner_enter|fit_images|home_banners|fit_literals|home_image_lists|home_types|home_spaces|home_colors|home_costs|home_styles/
        'on'
      when (key =~ /channel_tips/) && /channel_tips/
        'on'
      when (key =~ /banner/) && /banner_group|banner_home|banner_channel|banner_refresh|banner_activities|banner_company|banner_images|banner_weekly_stars|banner_other_pages|banner2014minisite|special_kv/
        'on'
      when (key =~ /life/) && /life_memoirs|life_info/
        'on'
      when (key =~ /column/) && /universal_column/
        'on'
      when (key =~ /designer_events/) && /designer_events|other_events|event_kvs/
        'on'
      when (key =~ /minisite_counters/) && /minisite_counters/
        'on'
      else
        'off'
    end
    flag
  end

end
