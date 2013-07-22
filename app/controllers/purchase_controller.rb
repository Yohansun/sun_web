# encoding: utf-8
class PurchaseController < ApplicationController
	before_filter :find_user

  def index
  	@point_products = PointProduct.all
  	@point_product_number = (1..15).to_a
  	@point_stores = PointStore.all
  	@point_users = PointUser.where(user_id: current_user.id)

  	@total_point, @user_total_point = 0, 0
  	@total_point = PointUser.user_pass_total_points current_user.id
  	@user_total_point = PointUser.user_total_points current_user.id
  end

  def detail
  	point_user_id = params[:point_user_id]
  	@point_user = PointUser.find_by_id(point_user_id)

  	@point_user_name = @point_user.point_user.username if @point_user.present?
  	@point_user_buy_date = @point_user.created_at.to_s(:short_cn) if @point_user.present?

  	@point_exchanges = @point_user.point_exchanges if @point_user.present?

  	@total_points = 0
  	@total_points = @point_exchanges.sum(:total_point) if @point_exchanges.present?
  end

  def search_user
  	@user = nil
  	@user = User.where('username=?', params[:name]).first unless params[:name].blank?
  	# @user = User.username_or_name(params[:name]).first
  	if @user
  		if @user.role_name == "user"
		  	@point_products = PointProduct.all
		  	@point_product_number = (1..15).to_a
		  	@point_stores = PointStore.all

		  	render :partial => 'products', :content_type => 'text/html'
		  else
		  	render :text => '此用户身份不是普通用户'
		  end
	  else
	  	render :text => '此用户名不存在'
	  end
  end

  def add_product
  	area_ids, buyer_dates, store_nos, product_names, product_numbers, point_numbers = [], [], [], [], [], []

  	product_user_id = params[:product_user_id]
  	area_ids = params[:area_id]
  	buyer_dates = params[:buyer_date]
  	store_nos = params[:store_no]
  	product_names = params[:product_name]
  	product_numbers = params[:product_number]
  	user_id = params[:user_id]
  	point_numbers = params[:point_number]

  	begin
	  	unless product_user_id.blank?
	  		PointUser.transaction do
			  	@point_user = PointUser.create(
			  		:user_id => user_id,
			  		:point_user_id => product_user_id
			  	)
			  	if @point_user
			  		area_ids.each_with_index do |area_id, i|
			  			@point_product = PointProduct.find_by_product_name(product_names[i])
				  		PointExchange.create(
				  			:point_user_id => @point_user.id,
				  			:area_id => area_ids[i],
				  			:buy_date => buyer_dates[i],
				  			:point_store_id => store_nos[i],
				  			:point_product_id => @point_product.id,
				  			:product_number => product_numbers[i],
				  			:total_point => point_numbers[i]
				  		)
				  	end
			  	end
			  end
		  end

		  render :json => {:result => "success"}, :layout => false
		rescue => e
			render :text => '产品选择错误，请重新添写'
		end
	  
  end

end
