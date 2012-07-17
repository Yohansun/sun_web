# -*- encoding : utf-8 -*-

class GiftsController < ApplicationController
	before_filter :get_dates_1
	before_filter :get_dates_2
	before_filter :get_dates_3
	before_filter :get_dates_4

	def index
		@gift1 = Gift.where(" gift_type like ?", "iColor点评王奖").order("give_time DESC")
		@gift2 = Gift.where(" gift_type like ?", "月度最佳色彩及设计奖").order("give_time DESC")
		@gift3 = Gift.where(" gift_type like ?", "注册幸运奖").order("give_time DESC")
		@gift4 = Gift.where(" gift_type like ?", "投票有礼奖").order("give_time DESC")
    end
       

	def get_dates_1
         @dates_arr1 = []              
         @gift1 = Gift.where(" gift_type like ?", "iColor点评王奖").order("give_time DESC")
         unless @gift1.nil?
             @gift1.each do |g|
              time = [(g.give_time - 1.days), (g.end_time - 1.days)]
                unless @dates_arr1.include? time
                    @dates_arr1 << time     
                end  
             end
         @dates_arr1
         end
	end

	def get_dates_2
    	@dates_arr2 = []
    	@gift2 = Gift.where(" gift_type like ?", "月度最佳色彩及设计奖").order("give_time DESC")
    	unless @gift2.nil?
     	@gift2.each do |g|  
     		time = g.end_time.strftime("%Y/%m")
     		unless @dates_arr2.include? time	
     			@dates_arr2 << time 	
     		end		
		end
		@dates_arr2
	    end
	end

	def get_dates_3
    	 @dates_arr3 = []              
         @gift3 = Gift.where(" gift_type like ?", "注册幸运奖").order("give_time DESC")
         unless @gift3.nil?
             @gift3.each do |g|
              time = [(g.give_time - 1.days), (g.end_time - 1.days)]
                unless @dates_arr3.include? time
                    @dates_arr3 << time     
                end  
             end
         @dates_arr3
         end
	end

	def get_dates_4
    	@dates_arr4 = []
    	@gift4 = Gift.where(" gift_type like ?", "投票有礼奖").order("give_time DESC")	
    	unless @gift4.nil?
     	@gift4.each do |g|
     		time = g.end_time.strftime("%Y/%m")
     		unless @dates_arr4.include? time	
     			@dates_arr4 << time 	
     		end		
		end
		@dates_arr4
	    end
	end
end
