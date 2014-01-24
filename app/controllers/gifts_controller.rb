# -*- encoding : utf-8 -*-

class GiftsController < ApplicationController
  layout "home_manage"
	def index
        @banners = IBanner.page_name('获奖名单').order("position ASC").all
        @event_kv = EventKv.includes(:kv_maps).page_name('gifts').try(:first)
        #注册有奖
        @reg_luck = Gift.where("gift_type like ?", "注册幸运奖").order("give_time DESC")
        @regs = @reg_luck.collect{|item| [item.give_time - 1.days, item.end_time - 1.days]}.uniq

        #投票有礼
        @vote_luck = Gift.where("gift_type like ?", "投票有礼奖").order("give_time DESC")
        @votes = @vote_luck.collect{|item| item.end_time.strftime("%Y/%m")}.uniq

        @month_best = Gift.where("gift_type like ?", "月度最佳色彩及设计奖").order("give_time DESC")
        @months = @month_best.collect{|item| item.end_time.strftime("%Y/%m")}.uniq
    end

    def list
    end
end
