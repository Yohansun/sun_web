# -*- encoding : utf-8 -*-
class CollectsController < ApplicationController
	before_filter :find_user
	def index
		@images = current_user.collects.page(params[:page]).per(8)
	end
	def create
		@collect = Collect.new()
		@collect.user_id = current_user.id
		if params[:weekly_star_id]
				@collect.weekly_star_id = params[:weekly_star_id]
				@collect.save
				# redirect_to weekly_stars_path(star_type: "每周之星", from: "top")
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
				
		end
		render :action => 'create'

	end

	def destroy
		current_user.collects.find(params[:id]).destroy
		redirect_to user_collects_path(@user)
	end
end