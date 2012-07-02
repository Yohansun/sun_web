# -*- encoding: utf-8 -*-
class Sellers::SellerSmsController < ApplicationController
	layout "sellers"

	def index
		if current_seller_user
			areas = Area.find(current_seller_user.area_id).self_and_descendants
			companies = User.where("area_id in (?) and role_id = ?", areas, 2).order("is_top desc") 
			@companies = companies.page(params[:page]).per(10)			
		else
			redirect_to new_seller_user_session_path	
		end	
	end	

	def sms
		ids = params[:sms_data][:ids]
		content = params[:sms_data][:content]
		if content.blank?
			render :text => "亲，您未填写发送内容！" 
		else
			ids.each do |id|
				user = User.find(id)
				if user.phone.present? || user.phone != "NULL"
					response = Sms.new(content, user.phone).transmit					

					SmsLog.create( 
						:seller_user_id => current_seller_user.id,
						:user_id => id,
						:content => content,
						:response => response,
						:send_id => response[:send_id],
						:result => response[:result],
						:description => response[:description]
					 )
				end	
			end	
			render :text => "亲，您的短信已经完成,请刷新页面查看状态更新！" 
		end	
	end	
end