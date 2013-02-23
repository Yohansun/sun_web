# -*- encoding : utf-8 -*-
class VisitIpsController < ApplicationController

	def create
		if params[:ip]
			request_ip = VisitIp.create(ip: params[:ip])
			render nothing: true
		end
	end
end
