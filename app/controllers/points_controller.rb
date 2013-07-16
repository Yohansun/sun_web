# encoding: utf-8
class PointsController < ApplicationController
	before_filter :find_user

  def index
  	@point_gifts = PointGift.page(params[:page]).per(8)
  	@point_products = PointProduct.all
  	@middle_value = @point_products.count / 2
  end

  def exchange
  	@point_gifts = PointGift.page(params[:page]).per(8)

  	@point_users = PointUser.where(user_id: current_user.id)
  	@totol_point = 0
  	@totol_point = @point_users.collect{|item| item.point_exchanges.sum(:total_point) }.sum if @point_users
  end

  def add_gift
  	gift_user_id = params[:gift_user_id]
  	gift_names = params[:gift_name]
  	gift_points = params[:gift_point]
  	gift_numbers = params[:gift_number]
  	total_gift_points = params[:total_gift_point]

  	begin
	  	unless gift_user_id.blank?
	  		gift_names.each_with_index do |gift_name, i|
	  			@point_gift = PointGift.find_by_gift_name(gift_name)
			  	PointUserGift.create(
				  		:user_id => gift_user_id,
				  		:point_gift_id => @point_gift.id,
				  		:gift_point => gift_points[i],
				  		:gift_number => gift_numbers[i],
				  		:total_point => total_gift_points[i]
			  		)
		  	end
		  end
	  rescue => e
			render :text => '礼品选择错误，请重新添写'
		end
  	render :json => {:result => "success"}, :layout => false
  end

end
