# -*- encoding : utf-8 -*-
class CollectsController < ApplicationController
	before_filter :find_user
	def index
		@images = current_user.collects.page(params[:page]).per(12)
	end
	def create
		sun = []
		current_user.collects.each do |c|
			if (params[:design_image_id].to_i).equal?(c.design_image_id.to_i)
			end
		end
		unless sun.any?
			@collect = Collect.new()
			@collect.user_id = current_user.id
			@collect.design_image_id = params[:design_image_id]
			@collect.save
			redirect_to user_design_images_path(@user.id, page: params[:page])
		end
	end
	def destroy
		current_user.collects.find(params[:id]).destroy
		redirect_to user_collects_path(@user)
	end
end