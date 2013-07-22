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

    @total_point = PointUser.user_pass_total_points current_user.id
    @user_total_point = PointUser.user_total_points current_user.id
  end

  def add_gift
    p params
  	gift_user_id = params[:gift_user_id]
  	gift_names = params[:gift_name]
  	gift_points = params[:gift_point]
  	gift_numbers = params[:gift_number]
  	total_gift_points = params[:total_gift_point]

  	begin
      @user_total_point = PointUser.user_total_points current_user.id
      user_gift_points = total_gift_points.inject(0) { |sum, v| sum += v.to_i}

      if @user_total_point < user_gift_points
        render :text => '可用积分不足，无法完成本次兑换'
      else
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
        render :json => {:result => "success"}, :layout => false
      end
	  rescue => e
			render :text => "礼品选择错误，请重新添写"
		end
  end

end
