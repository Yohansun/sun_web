class ScoresController < ApplicationController
	def share_score
		if current_user
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
				ds = Design.find params[:data_id]
				ds.update_attributes(:shares_count => ds.shares_count + 1)
			when "WeeklyStar"
				ws = WeeklyStar.find params[:data_id]
				ws.update_attributes(:shares_count => ws.shares_count + 1)
			when "Inspiration"
				insp = Inspiration.find params[:data_id]
				insp.update_attributes(:shares_count => insp.shares_count + 1)
			end				
			current_user.share_score(current_user, score_type)
			render :text => "ok"
		else
			render :text => "no user"
		end		
	end

end
