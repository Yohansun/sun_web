# -*- encoding : utf-8 -*-

class GiftsController < ApplicationController
	#before_filter :get_gifts
	def index
		@gift1 = Gift.where(" gift_type like ?", "iColor点评王奖").order("created_at desc")
		@gift2 = Gift.where(" gift_type like ?", "月度最佳色彩及设计奖").order("created_at desc")
		@gift3 = Gift.where(" gift_type like ?", "注册幸运奖").order("created_at desc")
		@gift4 = Gift.where(" gift_type like ?", "投票有礼奖").order("created_at desc")

		
	end
end
