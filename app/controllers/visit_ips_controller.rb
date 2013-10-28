# -*- encoding : utf-8 -*-
class VisitIpsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
		if VisitIp.find_by_ip(params[:ip]) == nil
			request_ip = VisitIp.create(ip: params[:ip])
		end
    render nothing: true
	end
end
