#encoding: utf-8

# -*- encoding:utf-8 -*-

module MagicContent
	class EventAttendeeController < BaseController
	  def index
	  	@eas = EventAttendee.order('id desc')
	  end

	  def delete_inspiration
	  	@alert = '删除成功'
	  	@ea = EventAttendee.find params[:event_attendee_id]
	  	@alert = '删除失败' unless @ea.design_image.delete
	  end
	end
end
