#encoding: utf-8
module Manage::BannerGroupHelper

	def link_banner_show page_name, position
		link = case page_name
      when /首页/
      	"/manage/banner_home?position=#{position}"
      when /设计快查/
      	"/manage/banner_channel?position=#{position}"
      else
      	"/manage/banner_group"
    end
    link
	end

end
