class RefreshController < ApplicationController
	layout "refresh"

	def design_upload
		if current_user
			url = if !current_user.common_user?
				 				new_user_design_path(user_id: current_user, utm_source: 'refresh_design_upload', utm_medium: 'kv', utm_content: 'refresh_design_upload', utm_campaign: 'kv')
						else
								"/designs"
						end
			redirect_to url
		else
			redirect_to root_path
		end
	end
end
