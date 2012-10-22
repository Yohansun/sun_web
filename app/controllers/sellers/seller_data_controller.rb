# -*- encoding: utf-8 -*-
class Sellers::SellerDataController < ApplicationController
	layout "sellers"

	def index
		if current_seller_user
			areas = Area.find(current_seller_user.area_id).self_and_descendants
			@jxs_total = User.where("area_id in (?) and role_id = ?", areas, 2).order("is_top desc","top_order asc","is_imported desc")
			@sign_total = @jxs_total.map {|m| m.try(:sign_in_count)}.sum
			@designs_count_total = @jxs_total.map {|m| m.designs.includes(:design_images).where('design_images.file_file_size > 0').count}.sum
			@votes_count_total = @jxs_total.map {|m| m.designs.sum(:votes_count)}.sum
			@comments_count_total = @jxs_total.map {|m| m.designs.map {|d| d.comments.count }.sum}.sum
			@seller_data_total = @jxs_total.map {|m| (m.try(:seller_datas).try(:first).try(:sales).blank?) ? 0 : m.seller_datas.first.sales}.sum

			product_top1_total = @jxs_total.map {|m| (m.try(:seller_datas).map{|d| d.try(:product_top1_quantity) }.sum.blank?) ? 0 : m.seller_datas.map{|d| d.product_top1_quantity }.sum }.sum
			product_top2_total = @jxs_total.map {|m| (m.try(:seller_datas).map{|d| d.try(:product_top2_quantity) }.sum.blank?) ? 0 : m.seller_datas.map{|d| d.product_top2_quantity }.sum }.sum
			product_top3_total = @jxs_total.map {|m| (m.try(:seller_datas).map{|d| d.try(:product_top3_quantity) }.sum.blank?) ? 0 : m.seller_datas.map{|d| d.product_top3_quantity }.sum }.sum
			@array_total = product_top1_total + product_top2_total + product_top3_total

			@art_paint_total = @jxs_total.map {|m| (m.try(:seller_datas).current_month.try(:first).try(:art_paint_quantity).blank?) ? 0 : m.seller_datas.current_month.first.art_paint_quantity}.sum

			@current_month_total = @jxs_total.map {|m| (m.try(:seller_datas).current_month.try(:first).try(:sales).blank?) ? 0 : m.seller_datas.current_month.first.sales}.sum
			@companies = @jxs_total.page(params[:page]).per(12)	
			@companies_top = @jxs_total.limit 12	
		else
			redirect_to new_seller_user_session_path
		end	
	end	

	#更新置顶信息,如果置顶的记录未发生修改就不提交
	def set_top
		top_reason = params[:user_data][:top_reason]
		top_order  = params[:user_data][:top_order]
		top_record    = current_seller_user.top_record

		if top_record.present?
			t, d = top_record.split("/")[0].to_i, top_record.split("/")[1].to_datetime
		end

		user = User.find params[:user_id]
		user.is_top, user.top_reason, user.top_order = true, top_reason, top_order

		if user.changed?
			if top_reason.blank? || top_order.blank?
				return @messages = '置顶序号或置顶原因不能为空!'
			else
				user.save :validate => false #保存置顶原因和置顶序号

				if top_record.blank? || (top_record.present? && !Time.now.all_quarter.cover?(d))
					current_seller_user.update_attribute :top_record, "1/#{Time.now}"
				else
					if Time.now.all_quarter.cover?(d) && t.eql?(10)
						return @messages = "您本季度已经使用了10次置顶机会!"
					else
						current_seller_user.update_attribute :top_record, "#{t+1}/#{Time.now}"
					end
				end

				return @user = user
			end
		else
			return @changed = false
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
		elsif params[:seller_data][:art_paint_quantity]
			return @art_paint_quantity = seller_data.art_paint_quantity
		elsif params[:seller_data][:remarks]
			return @remarks = seller_data.remarks	
		else
			array = []
			array	<< ("<p>" + seller_data.product_top1 + ":" + seller_data.product_top1_quantity.to_s + "</p>") unless seller_data.product_top1.blank?
			array	<< ("<p>" + seller_data.product_top2 + ":" + seller_data.product_top2_quantity.to_s + "</p>") unless seller_data.product_top2.blank?
			array	<< ("<p>" + seller_data.product_top3 + ":" + seller_data.product_top3_quantity.to_s + "</p>") unless seller_data.product_top3.blank?
			
			return @products = array.join(" ")
		end	
		
	end
end