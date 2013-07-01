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
      #统计数
      @count1 = Story.available(begin_t.beginning_of_day,end_t.end_of_day).count
      @count2 = Story.has_uploaded.count - @count1
      @count3 = @count1 + @count2
      @count4 = StoryUser.uniq_story.where(design_time: begin_t.beginning_of_day..end_t.end_of_day).count
      @count5 = @count1 - @count4
      @count6 = Design.story_design.where(created_at: begin_t.beginning_of_day..end_t.end_of_day).map(&:story_id).uniq.count
      @count7 = @count1 - @count6
      @count8 = Design.story_design.where(created_at: begin_t.beginning_of_day..end_t.end_of_day).count
      @count10 = Design.story_design.count
      @count9 = @count10 - @count8
      @count11 = Design.story_talking_design.where(created_at: begin_t.beginning_of_day..end_t.end_of_day).count
      @count12 = Contract.where(created_at: begin_t.beginning_of_day..end_t.end_of_day).count

      if params[:submit]
        send_data  @results.with_detail_to_csv.encode("gb18030"), :type => 'text/csv; charset=gb18030; header=present',:filename =>"baicheng_daily_report_#{Time.now.to_date.to_s}.csv" 
      else
        @results = @results.page(params[:page])
      end
    end
  end
end
