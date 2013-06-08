# encoding: utf-8
module MagicContent
  class BaichengController < BaseController

    def daily_report
      case params[:search_type]  
      when 'yesterday'
        begin_t = Time.now.yesterday
        end_t = Time.now.yesterday
      when 'custom'
        begin_t = DateTime.strptime(params[:begin_date],'%Y-%m-%d')
        end_t = DateTime.strptime(params[:end_date],'%Y-%m-%d')
      else 
        begin_t = Time.now
        end_t = Time.now
      end
      @results = Story.has_uploaded.includes(:want_designers=>:designs).where(created_at: begin_t.beginning_of_day..end_t.end_of_day)
      if params[:submit]
        send_data  @results.with_detail_to_csv, :type => 'text/csv; charset=utf8; header=present',:filename =>"baicheng_daily_report_#{Time.now.to_date.to_s}.csv" 
      else
        @results = @results.page(params[:page])
      end
    end
  end
end
