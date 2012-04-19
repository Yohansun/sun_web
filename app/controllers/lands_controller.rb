# -*- encoding : utf-8 -*-
class LandsController < ApplicationController
	def landing
		Land.create(:source => params[:source], :source_ip => request.remote_ip )
		redirect_to root_path
	end
end
