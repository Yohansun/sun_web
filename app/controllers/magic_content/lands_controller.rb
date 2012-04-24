# -*- encoding : utf-8 -*-
module MagicContent
  class LandsController < BaseController
    #统计
    def index
      source    = params[:source] || Land::SOURCE[0]
      begin_at  = params[:begin_at] || (Time.now).strftime("%Y-%m-%d") 
      end_at    = params[:end_at] || (Time.now + 1.day).strftime("%Y-%m-%d")
      @lands = Land.find( :all, 
                          :select => "source, count(*) as count",
                          :conditions => ["created_at >= ? and created_at < ?", begin_at, end_at],
                          :group => "source"
                        )
    end
  end
end