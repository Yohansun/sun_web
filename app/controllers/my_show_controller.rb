class MyShowController < ApplicationController

	helper_method :latest_login_user

	def index
		@show_ads = MyShowImgUpload.order("created_at desc").first

		@top_recommended = MyShowSetting.top_recommended.split(",")[0,5].map {|id| User.find id} if  MyShowSetting.top_recommended.present?
		@impact_force_ranking = MyShowSetting.impact_force_ranking.split(",")[0,5].map {|id| User.find id} if  MyShowSetting.impact_force_ranking.present?
		@mys_show_kv_list = User.where("id in (?)", MyShowSetting.mys_show_kv_list.split(",")).limit(48) if  MyShowSetting.mys_show_kv_list.present?
	end	

	def autocomplete_username
		users = User.select("id,username,name").where("name LIKE ? OR username like ?", "%#{params[:q]}%","%#{params[:q]}%").all.map {|a| a.display_name }
		render :text => users.join("\n")
	end	

	def latest_login_user(*args)		
		role_id, des_status = args[0], args[1]
		users = User.where(:role_id => role_id).order("last_sign_in_at desc")
		users = users.where(:des_status => des_status) if des_status.present?
		users = users.limit 12
	end	
end
