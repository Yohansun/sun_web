# -*- encoding : utf-8 -*-
module MagicContent
  class MyShowSettingsController < BaseController

  	def create
  		MyShowSetting.mys_show_kv_list = params[:mys_show_kv_list] if params[:mys_show_kv_list]
  		MyShowSetting.top_recommended = params[:top_recommended] if params[:top_recommended]
  		MyShowSetting.impact_force_ranking = params[:impact_force_ranking] if params[:impact_force_ranking]
  		@upload = MyShowImgUpload.create(:img => params[:img]) if params[:img]
 
  		redirect_to main_app.my_show_settings_path
  	end	
  end
end
