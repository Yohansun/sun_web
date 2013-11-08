class ScoresController < ApplicationController
	def share_score
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
		case params[:data_type]
		when "Design"
			Design.increment_counter(:shares_count, params[:data_id])
		when "WeeklyStar"
			WeeklyStar.increment_counter(:shares_count, params[:data_id])
		when "Inspiration"
			Inspiration.increment_counter(:shares_count, params[:data_id])
		when "ColorDesign"
			ColorDesign.increment_counter(:shares_count, params[:data_id])
		when "Mood"
			Mood.increment_counter(:shares_count, params[:data_id])
		when "huaxun"
			Example.increment_counter(:shares_count, params[:data_id])
		end
		current_user.share_score(current_user, score_type) if current_user
		render :text => "score ok"
	end

end
