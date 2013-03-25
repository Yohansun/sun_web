# -*- encoding : utf-8 -*-
class VisitIpsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
		if params[:ip]
			request_ip = VisitIp.create(ip: params[:ip])
			render nothing: true
		end
	end
end
