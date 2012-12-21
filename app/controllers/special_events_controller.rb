# encoding: utf-8
class SpecialEventsController < ApplicationController
  before_filter :fetch_event
  respond_to    :html, :json

  def show
    
  end

  def join
    result = ''
    joined_count = EventAttendee.joined_for(params[:id], current_user.id).size
    name = current_user.display_name
    if joined_count < 3
      ea = EventAttendee.create(special_event_id: params[:id], user_id: current_user.id, benediction: params[:attendee][:benediction])
      ea.sync_to_social("weibo"," #iColor温馨圣诞#，来自#{name}从iColor网站发出的圣诞祝福，更多精彩尽在 http://www.icolor.com.cn")
      image = params[:attendee][:image_id].blank? ? nil : DesignImage.find_by_id(params[:attendee][:image_id])
      if image
        inspiration = ea.user.inspirations.create(title: "#{name}的圣诞祝福图片",
                                                content: "#{name}的圣诞祝福图片")
        image.update_attribute(:user_id, current_user.id)
        inspiration.design_images << image
        ea.update_attribute(:design_image_id, image.id)
      end
      # if !params[:attendee][:image].blank?
      #   mime_type = MIME::Types.type_for(params[:attendee][:image].original_filename).to_s
      #   if /image\/(\S){3,4}/.match(mime_type)
      #     begin
      #       image.file = params[:attendee][:image]
      #       image.user_id = current_user.id
      #       image.save!
      #       inspiration = ea.user.inspirations.create(title: "#{name}的圣诞祝福图片",
      #                                           content: "#{name}的圣诞祝福图片")
      #       inspiration.design_images << image
      #     rescue Exception => e
      #       Rails.logger.debug("Upload Xmas image failed: #{e.backtrace.join("\n")}")
      #     end
      #   end
      # end
      result = ea.luckjoy(image.try(:persisted?), !ea.benediction.blank?, current_user)
      ea.update_attribute :award_mark, result
    else
      result = 'overtime'
    end
    respond_to do |format|
      format.json { render :json => { result: result }, :status => :ok }
    end    
  end

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
