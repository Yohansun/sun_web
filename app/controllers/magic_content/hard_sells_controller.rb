# -*- encoding : utf-8 -*-
module MagicContent
  class HardSellsController < BaseController
    def index
      if params[:start_date].blank?
        params[:start_date] = Time.now.beginning_of_week.to_date.to_s
      end

      if params[:end_date].blank?
        params[:end_date] = Time.now.end_of_week.to_date.to_s
      end

      params[:start_date] += " 00:00:00"
      params[:end_date]   += " 23:59:59"

      begin_t = params[:start_date].to_time(:local)
      end_t   = params[:end_date].to_time(:local)

      @results = search_for_hardsells(date: begin_t..end_t)
    end

    protected

      def search_for_hardsells(args)
        hardsells = HardSell.where(date: args[:date])

        {}.tap do |results|
          results[:search] = "硬广点击数据查询"
          results[:columns] = ['站点','位置','代码','日期','点击数']
          results[:data] = [].tap do |cell|
          hardsells.find_each do |hs|
            cell << [hs.site,hs.feature,hs.link,hs.date.to_date,hs.num]
          end
        end
      end
    end  

  end
end