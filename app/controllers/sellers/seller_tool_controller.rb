# -*- encoding : utf-8 -*-
class Sellers::SellerToolController < ApplicationController
	layout "sellers"

	def index
		if current_seller_user
			@tools = Tool.page(params[:page]).per(4)
		else
			redirect_to new_seller_user_session_path	
		end		
	end	

	def apply_for_tools
		if current_seller_user
			seller_datas = current_seller_user.seller_datas

			tool = Tool.find params[:seller_user][:tool_ids]
			if (tool.total - tool.has_applied).eql? 0
				render :text => "亲，您申请的色彩工具已经没有剩余！"
			else
				if seller_datas.apply_tools.blank?
					seller_datas.create params[:seller_user]
					tool.increment!(:has_applied)
					render :text => "亲，申请成功！"
				else
					tools = seller_datas.apply_tools.first
					tool_ids = tools.tool_ids.split(",")

					if tool_ids.size.eql? 2
						render :text => "亲，您本季度已经申请了2种色彩工具！"
					else
						tools.update_attribute :tool_ids, (tool_ids << params[:seller_user][:tool_ids]).join(",")	
						tool.increment!(:has_applied)
						render :text => "亲，申请成功！"
					end	
				end
			end
		end	
	end	
end