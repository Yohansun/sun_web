module MagicContent
  class BaichengController < BaseController

    def daily_report
      
      case params[:search_type]  
      when 'yesterday'
        begin_t = Time.now.yesterday.beginning_of_day
        end_t = Time.now.yesterday.end_of_day
      when 'custom'
        begin_t = Time. params[:begin_date]
          
        end_t =  params[:end_date]
      else 
        begin_t = Time.now.beginning_of_day
        end_t = Time.now.end_of_day
      end
      @results = Story.where(created_at: begin_t..end_t).page(params[:page])
    end
  end
end
