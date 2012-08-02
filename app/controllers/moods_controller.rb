# -*- encoding : utf-8 -*-
class MoodsController < ApplicationController
	before_filter :find_user

	def index
		if @user
			@moods = Mood.order("created_at desc").page(params[:page]).per(5)
		end	

		@weekly_stars = WeeklyStar.order("published_at desc").limit 5
		
		load_skin
	end

	def create
		@mood = current_user.moods.new params[:mood]
		content = params[:mood][:content]

		if @mood.save && @mood.is_privacy?
			current_user.user_tokens.where(is_binding: true).each do |token|
				if @mood.color_name.present?
					send_content = content + "   今天我的心情是#{@mood.color_name}，就如立邦的#{ColorCode.find_by_code(@mood.color_code).name}（颜色色号名称),那你的呢？ 来自http://www.icolor.com.cn的色彩心情"
				else
					send_content = content
				end

				Mood.send("send_#{token.provider}", access_token: token.access_token, content: send_content, openid: token.uid)
			end
		end

		redirect_to user_moods_path(@user)
	end
end