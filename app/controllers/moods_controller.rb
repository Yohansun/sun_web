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
					Mood.send_weibo(token.access_token,content) if @mood.is_privacy? && token.provider.eql?('weibo')
				end
			end

			redirect_to user_moods_path(@user)
		end
	end	
end