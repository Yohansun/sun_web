# -*- encoding : utf-8 -*-
class MoodsController < ApplicationController
	before_filter :find_user

	def index
		if @user
			@moods = Mood.order("created_at desc").page(params[:page]).per(5)
		end	

		@weekly_stars = WeeklyStar.order("published_at desc").limit 5
		
		render :template => "users/moods"
	end

	def create
		@mood = current_user.moods.new params[:mood]
		content = params[:mood][:content]

		if @mood.save
			current_user.user_tokens.each do |token|
				if token.is_binding?
					content = (content + "&nbsp;&nbsp;&nbsp;&nbsp;今天我的心情是#{@mood.color_name}，就如立邦的#{ColorCode.find_by_code(@mood.color_code).name}（颜色色号名称),那你的呢？ 来自http://www.icolor.com.cn的色彩心情") if @mood.color_name.present? 
					Mood.send_weibo(token.access_token,content) if @mood.is_privacy? && token.provider.eql?('weibo')
				end
			end

			redirect_to user_moods_path(@user)
		end
	end	
end