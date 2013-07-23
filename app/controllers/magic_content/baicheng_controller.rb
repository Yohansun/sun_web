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

    def story_screen
      if params[:where_name]
        case params[:search_type]  
        when 'username'
          user = User.where("username = '#{params[:where_name]}' or name = '#{params[:where_name]}'") 
          if user.present?
            user_id = user.map(&:id).join(",")
            @stories = Story.where("user_id in (#{user_id})") 
          end
        when 'story_id'
          @stories = Story.where(id: params[:where_name])
        end
      end
    end

    def story_del
      if params[:baicheng_id]
        story = Story.find params[:baicheng_id]
        story.is_save = false
        story.save
        name = story.user.name ? story.user.name : story.user.username
        if params[:search_type] && params[:search_type] == "story_id"
          redirect_to main_app.baicheng_story_screen_path(where_name: story.id,search_type: "story_id")
        else
          redirect_to main_app.baicheng_story_screen_path(where_name: name,search_type: "username")
        end
      end
    end

    def story_restoration
      if params[:baicheng_id]
        story = Story.find params[:baicheng_id]
        story.is_save = true
        story.save
        name = story.user.name ? story.user.name : story.user.username
        if params[:search_type] && params[:search_type] == "story_id"
          redirect_to main_app.baicheng_story_screen_path(where_name: story.id,search_type: "story_id")
        else
          redirect_to main_app.baicheng_story_screen_path(where_name: name,search_type: "username")
        end
      end
    end
  end
end
