module MagicContent
  class BaichengController < BaseController

    def daily_report
      
      case params[:search_type]  
      when 'yesterday'
        begin_t = Time.now.yesterday.beginning_of_day
        end_t = Time.now.yesterday.end_of_day
      when 'custom'
        begin_t =   params[:begin_date].to_time.beginning_of_day
        end_t =  params[:end_date].to_time.end_of_day
      else 
        begin_t = Time.now.beginning_of_day
        end_t = Time.now.end_of_day
      end
      @results = Story.has_uploaded.where(created_at: begin_t..end_t).page(params[:page])
    end
  end
end
