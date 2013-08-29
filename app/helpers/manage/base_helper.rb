module Manage::BaseHelper

	def nav_path
		c_name = case controller_name
      when /home_kvs|home_recommends|home_life_videos|questions|home_image_lib|home_design_show|owner_enter|fit_images|home_banners|fit_literals|home_image_lists|home_types|home_spaces|home_colors|home_costs|home_styles/
      	'home'
      when /channel_tips/
      	'channel_tips'
      when /banner_group|banner_home|banner_channel|special_kv/
      	'banner'
      when /tag_sorts/
        'design_images'
      when /life_memoirs|life_info/
        'life'
      else
      	'nothing'
    end
    "manage/base/#{c_name}"
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
