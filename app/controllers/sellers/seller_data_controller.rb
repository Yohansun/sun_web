# -*- encoding: utf-8 -*-
class Sellers::SellerDataController < ApplicationController
	layout "sellers"

	def index
		if current_seller_user
			areas = Area.find(current_seller_user.area_id).self_and_descendants
			companies = User.where("area_id in (?) and role_id = ?", areas, 2).order("is_top desc","top_order asc") 
			@companies = companies.page(params[:page]).per(12)	
			@companies_top = companies.limit 12	
		else
			redirect_to new_seller_user_session_path	
		end	
	end	

	#set_top
	def set_top
		user = User.find params[:user_id]
		user.is_top, user.top_reason, user.top_order = true, params[:user_data][:top_reason], params[:user_data][:top_order]

		if params[:user_data][:top_reason].blank? || params[:user_data][:top_order].blank?
			return
		else
			user.save :validate => false

			top_log = current_seller_user.top_log

			if top_log.blank? || (top_log.present? && !Time.now.all_quarter.cover?(top_log.split("/")[1].to_datetime))
				current_seller_user.update_attribute :top_log, "1/#{Time.now}"
			else
				t, d = top_log.split("/")[0].to_i, top_log.split("/")[1]

				if Time.now.all_quarter.cover?(d.to_datetime) && t.eql?(10)
					return @message = "您本季度已经使用了10次置顶机会!"
				else
					current_seller_user.update_attribute :top_log, "#{t+1}/#{Time.now}"
				end
			end

			return @user = user
		end
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