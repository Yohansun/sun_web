# -*- encoding : utf-8 -*-
class CollectsController < ApplicationController
	before_filter :find_user
	def index
		@images = current_user.collects.page(params[:page]).per(8)
	end
	def create
		if params[:weekly_star_id]
			sun1 = []
			current_user.collects.each do |c|
				if (params[:weekly_star_id].to_i).equal?(c.weekly_star_id.to_i)
				end
			end
			unless sun1.any?
				@collect = Collect.new()
				@collect.user_id = current_user.id
				@collect.weekly_star_id = params[:weekly_star_id]
				@collect.save
				redirect_to weekly_stars_path(star_type: "每周之星", from: "top")
			end
		elsif params[:design_image_id]
			sun2 = []
			current_user.collects.each do |c|
				if (params[:design_image_id].to_i).equal?(c.design_image_id.to_i)
				end
			end
			unless sun2.any?
				@collect = Collect.new()
				@collect.user_id = current_user.id
				@collect.design_image_id = params[:design_image_id]
				@collect.save
				redirect_to user_design_images_path(@user.id, page: params[:page])
			end
		elsif params[:color_design_id]
			sun3 = []
			current_user.collects.each do |c|
				if (params[:color_design_id].to_i).equal?(c.color_design_id.to_i)
				end
			end
			unless sun3.any?
				@collect = Collect.new()
				@collect.user_id = current_user.id
				@collect.color_design_id = params[:color_design_id]
				@collect.save
				redirect_to "/color_designs/" + params[:color_design_id]
			end
		elsif params[:master_design_id]
			sun4 = []
			current_user.collects.each do |c|
				if (params[:master_design_id].to_i).equal?(c.master_design_id.to_i)
				end
			end
			unless sun4.any?
				@collect = Collect.new()
				@collect.user_id = current_user.id
				@collect.master_design_id = params[:master_design_id]
				@collect.save
				redirect_to "/master_designs/" + params[:master_design_id]
			end
	    elsif params[:designs_id]
	    	sun5= []
	    	current_user.collects.each do |c|
				if (params[:designs_id].to_i).equal?(c.design_id.to_i)
				end
			end
			unless sun5.any?
				@collect = Collect.new()
				@collect.user_id = current_user.id
				@collect.design_id = params[:designs_id]
				@collect.save
				redirect_to "/designs/" + params[:designs_id]
			end


		end

	end

	def destroy
		current_user.collects.find(params[:id]).destroy
		redirect_to user_collects_path(@user)
	end
end