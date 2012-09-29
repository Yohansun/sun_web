# -*- encoding : utf-8 -*-
class LandsController < ApplicationController
	def landing
		Land.create(:source => params[:source], :source_ip => request.remote_ip )

		#10.1活动
		link = %w(
			taipingyangshouye
			taipingyangshejishishouye
			taipingyangshejishiwenzhang
			taipingyangzhuangshi
			taipingyangbankuaidingzhi
			zhuangxiulunbo
			zhuangxiubannner
			zhuangxiuketing
			zhuangxiuwuoshi
			zhuangxiuertong
			zhuangxiusecai)

		if link.include? params[:source]
			redirect_to national_day_path
		else
			redirect_to root_path
		end
	end
end