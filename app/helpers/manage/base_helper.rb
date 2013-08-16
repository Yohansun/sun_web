module Manage::BaseHelper

	def nav_path
		c_name = case controller_name
      when /home_kvs|home_recommends|home_image_lib|home_design_show|owner_enter|fit_images|home_banners/
      	'home'
      when /channel_tips/
      	'channel_tips'
      when /banner_group/
      	'banner'
      else
      	'nothing'
    end
    "manage/base/#{c_name}"
  end

  def left_menu_active key
    flag = case controller_name
      when (key =~ /home/) && /home_kvs|home_recommends|home_image_lib|home_design_show|owner_enter|fit_images|home_banners/
        'on'
      when (key =~ /channel_tips/) && /channel_tips/
        'on'
      when (key =~ /banner/) && /banner_group/
        'on'
      else
        'off'
    end
    flag
  end

end
