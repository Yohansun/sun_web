# -*- encoding : utf-8 -*-
module Baicheng::StoriesHelper

	def design_countdown story_user
		result = ''
		begin
			design_time = story_user.design_time
			now_time = Time.now
			expired_time = 15.day - 1.day
			future_time = design_time + expired_time


			if future_time > now_time
				number_of_day = ((future_time - now_time) / 1.day).round
				result = "倒计时<i class='i_icon i_icon_big icon_day'>#{number_of_day}</i>天"
			end

			if story_user.story.designs_count > 2
				result = "<i class='i_icon i_icon_xbig mar_h5 icon_full'></i>设计已满"
			end

			if future_time < now_time
				result = "<i class='i_icon i_icon_xbig mar_h5 icon_warn'></i>已过期"
			end
		rescue Exception => e
			puts e.to_s
		end

		result.html_safe
	end

end
