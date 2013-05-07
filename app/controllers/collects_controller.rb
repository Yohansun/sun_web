# -*- encoding : utf-8 -*-
class CollectsController < ApplicationController
	before_filter :find_user
	def index
		@images = @user.collects.page(params[:page]).per(8)
	end
	def create
		if check_collect(@user,params)
			@collect = Collect.new()
			@collect.user_id = @user.id
			if params[:weekly_star_id]
				@collect.weekly_star_id = params[:weekly_star_id]
				@collect.save
			elsif params[:design_image_id]
				@collect.design_image_id = params[:design_image_id]
				@collect.save
			elsif params[:color_design_id]
				@collect.color_design_id = params[:color_design_id]
				@collect.save
			elsif params[:master_design_id]
				@collect.master_design_id = params[:master_design_id]
				@collect.save
		  elsif params[:designs_id]
				@collect.design_id = params[:designs_id]
				@collect.save
			elsif params[:in_design_id]
				@collect.inspiration_id = params[:in_design_id]
				@collect.save
			elsif params[:story_id]
				Story.increment_counter(:votes_count, params[:story_id])
				@collect.story_id = params[:story_id]
				@collect.save
			end
			render :action => 'create'
		else
			render :js =>"alert('您已经收藏过了!');"
		end
	end

	def destroy
		current_user.collects.find(params[:id]).destroy
		redirect_to user_collects_path(@user)
	end

	private

	def check_collect(user,params)
		collect = Collect.where("user_id = ? and (weekly_star_id = ? or design_image_id = ? or color_design_id = ? or master_design_id = ? or design_id = ? or inspiration_id = ? or story_id = ?)",user,params[:weekly_star_id],params[:design_image_id],params[:color_design_id],params[:master_design_id],params[:designs_id],params[:in_design_id],params[:story_id])
		if collect.blank?
			return true
		else
			return false
		end
	end
end