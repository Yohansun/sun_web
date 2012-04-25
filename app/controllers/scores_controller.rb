class ScoresController < ApplicationController
	def share_score
		if current_user
			debugger
			score_type = 0
			case params[:share_id]
			when "tsina"
				score_type = 501
			when "qzone"
				score_type = 500
			when "renren"
				score_type = 502
			when "kaixin001"
				score_type = 503
			end
			current_user.share_score(current_user, score_type)
			render :text => "ok"
		end		
	end

end
