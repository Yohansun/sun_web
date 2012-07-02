# -*- encoding: utf-8 -*-
class Sellers::SellerDataController < ApplicationController
	layout "sellers"

	def index
		if current_seller_user
			areas = Area.find(current_seller_user.area_id).self_and_descendants
			companies = User.where("area_id in (?) and role_id = ?", areas, 2).order("is_top desc") 
			@companies = companies.page(params[:page]).per(12)	
			@companies_top = companies.limit 12	
		else
			redirect_to new_seller_user_session_path	
		end	
	end	

	#set_top
	def set_top
		user = User.find params[:user_id]
		user.is_top, user.top_reason = true, params[:user_data][:top_reason]
		user.save :validate => false
		
		return @top_reason = user.top_reason 
	end	

	#更新seller_data
	def update_seller_data
		user = User.find params[:user_id]
		seller_data = user.seller_datas.current_month.first
		if seller_data.nil?
			seller_data = SellerData.create(:user_id => params[:user_id])	 unless seller_data
		end

		seller_data.update_attributes(params[:seller_data])

		if params[:seller_data][:sales]
			return @sales = seller_data.sales
		else
			array = []
			array	<< ("<p>" + seller_data.product_top1 + "</p>") unless seller_data.product_top1.blank?
			array	<< ("<p>" + seller_data.product_top2 + "</p>") unless seller_data.product_top2.blank?
			array	<< ("<p>" + seller_data.product_top3 + "</p>") unless seller_data.product_top3.blank?
			
			return @products = array.join(" ")
		end	
		
	end

end