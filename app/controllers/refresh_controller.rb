class RefreshController < ApplicationController
	layout "refresh"

	def design_upload
		if current_user
			redirect_to new_user_design_path(user_id: current_user, utm_source: 'refresh_design_upload', utm_medium: 'kv', utm_content: 'refresh_design_upload', utm_campaign: 'kv')
		else
			redirect_to root_path
		end
	end
end
