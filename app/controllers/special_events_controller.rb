# encoding: utf-8
class SpecialEventsController < ApplicationController
  before_filter :fetch_event
  respond_to    :html, :json
  @@image_id = {}

  def show
    due_at = SpecialEvent.where(id: params[:id]).first if params[:id]
    if due_at.present? && due_at.due_at.present? 
      if Time.now.strftime("%Y%m%d").to_i > due_at.due_at.strftime("%Y%m%d").to_i
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def blessing
    if current_user
      if File.directory?("public/system/blessing") == false
        system("mkdir public/system/blessing")
      end
      blessing = params[:blessing].scan(/.{20}|.+/).join("\n\n")
      image = DesignImage.find(params[:attendee_image_id])
      system("convert #{image.file.path(:spring)} -background blue -rotate 355 public/system/blessing/#{image.id}.png")
      system("convert public/system/blessing/#{image.id}.png -transparent blue public/system/blessing/#{image.id}.png") 
      system("composite -geometry +490+173 -gravity SouthEast public/system/blessing/#{image.id}.png public/system/blessing/spring_card.png public/system/blessing/spring_card_#{image.id}.png")
      system("convert -font public/system/simsun.ttf -fill white -pointsize 16 -draw \"text 670,365 '#{current_user.username}'\" public/system/blessing/spring_card_#{image.id}.png public/system/blessing/bar_#{image.id}.png")
      system("convert -font public/system/simsun.ttf -annotate +0+0 -gravity NorthWest -fill white -pointsize 16 -draw \"text 440,160 '#{blessing}'\" public/system/blessing/bar_#{image.id}.png public/system/blessing/bar_text_#{image.id}.png")
      joined_count = EventAttendee.joined_for(params[:id], current_user.id).where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).count
      name = current_user.display_name

      if joined_count < 10
        ea = EventAttendee.create(special_event_id: params[:id], user_id: current_user.id)
        if image
          inspiration = ea.user.inspirations.create(title: "#{name}的祝福图片", content: "#{name}的祝福图片")
          image.update_attribute(:user_id, current_user.id)
          inspiration.design_images << image
          ea.update_attribute(:design_image_id, image.id)
        end

        @result = ea.luckjoy(image.try(:persisted?), current_user)
        ea.update_attribute :award_mark, @result
      end
      respond_to do |format|
        format.js
      end
    end
  end

  def send_greeting_cards
    if current_user
      line = " #春节传美图，iColor送祝福#{params[:friends]}；这是我在iColor送祝福活动中为你们制作的新春贺卡,亲们~收到祝福好运新年哦~你们也来祝福身边好友吧！活动地址：http://www.icolor.com.cn/special_events/3"
      ea = EventAttendee.where(special_event_id: params[:id], user_id: current_user.id).order("created_at DESC").first
      ea.sync_to_social("weibo", line, "#{Rails.root}/public/system/blessing/bar_text_#{params[:image_id]}.png")
    end
    redirect_to special_event_path(params[:id])
  end

  def award
    @result = 'D'
    if current_user
      joined_count = EventAttendee.joined_for(params[:id], current_user.id).where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).count
      name = current_user.display_name

      if joined_count < 10
        ea = EventAttendee.create(special_event_id: params[:id], user_id: current_user.id)
        image = DesignImage.find_by_id params[:image_id]
        if image
          inspiration = ea.user.inspirations.create(title: "#{name}的祝福图片", content: "#{name}的祝福图片")
          image.update_attribute(:user_id, current_user.id)
          inspiration.design_images << image
          ea.update_attribute(:design_image_id, image.id)
        end

        @result = ea.luckjoy(image.try(:persisted?), current_user)
        ea.update_attribute :award_mark, @result
      else
        @result = 'overtime'
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def weibo
    ea = EventAttendee.where(special_event_id: params[:id], user_id: current_user.id).order("created_at DESC").first
    image = DesignImage.find(ea.design_image_id)
    if params[:zhong] == '1'
      line = " 我在 #iColor元旦砸金蛋# 活动中砸到奖品咯！你也快来试试运气吧！ http://www.icolor.com.cn/special_events/2"
    else
      line = " 我在参加 #iColor元旦砸金蛋# 活动哟！你也快来试试运气吧！ http://www.icolor.com.cn/special_events/2"
    end
    ea.sync_to_social("weibo", line, image.file.path)
    render :text => 'OK'
  end

  # def join
  #   result = ''
  #   joined_count = EventAttendee.joined_for(params[:id], current_user.id).size
  #   name = current_user.display_name
  #   if joined_count < 3
  #     ea = EventAttendee.create(special_event_id: params[:id], user_id: current_user.id, benediction: params[:attendee][:benediction])
  #     ea.sync_to_social("weibo"," #iColor温馨圣诞#，来自#{name}从iColor网站发出的圣诞祝福，更多精彩尽在 http://www.icolor.com.cn")
  #     image = params[:attendee][:image_id].blank? ? nil : DesignImage.find_by_id(params[:attendee][:image_id])
  #     if image
  #       inspiration = ea.user.inspirations.create(title: "#{name}的圣诞祝福图片",
  #                                               content: "#{name}的圣诞祝福图片")
  #       image.update_attribute(:user_id, current_user.id)
  #       inspiration.design_images << image
  #       ea.update_attribute(:design_image_id, image.id)
  #     end
  #     # if !params[:attendee][:image].blank?
  #     #   mime_type = MIME::Types.type_for(params[:attendee][:image].original_filename).to_s
  #     #   if /image\/(\S){3,4}/.match(mime_type)
  #     #     begin
  #     #       image.file = params[:attendee][:image]
  #     #       image.user_id = current_user.id
  #     #       image.save!
  #     #       inspiration = ea.user.inspirations.create(title: "#{name}的圣诞祝福图片",
  #     #                                           content: "#{name}的圣诞祝福图片")
  #     #       inspiration.design_images << image
  #     #     rescue Exception => e
  #     #       Rails.logger.debug("Upload Xmas image failed: #{e.backtrace.join("\n")}")
  #     #     end
  #     #   end
  #     # end
  #     result = ea.luckjoy(image.try(:persisted?), !ea.benediction.blank?, current_user)
  #     ea.update_attribute :award_mark, result
  #   else
  #     result = 'overtime'
  #   end
  #   respond_to do |format|
  #     format.json { render :json => { result: result }, :status => :ok }
  #   end
  # end

  def check_mobile
    tel = params[:attendee][:telephone]
    respond_to do |format|
      format.json { render :json => { result: current_user.phone == tel ? 'success' : 'fail'}, :status => :ok }
    end
  end

  private
  def fetch_event
    @event = SpecialEvent.actived_event.first
  end
end