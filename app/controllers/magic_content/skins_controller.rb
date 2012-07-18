# -*- encoding : utf-8 -*-
module MagicContent
  class SkinsController < BaseController
  	action :all, :except => [:show]

  	def create
      build_kv_upload_params(params[:skin_kv], params[:skin_kv_upload]) 
  		create! { main_app.skins_path }
  	end

  	def update
      build_kv_upload_params(params[:skin_kv], params[:skin_kv_upload])
  		update! { main_app.skins_path }
  	end	

  	def destroy
  		destroy!{ main_app.skins_path }
  	end

    def build_kv_upload_params(arg1, arg2)
      if arg1 && arg1.include?("skin_kv_upload_ids")
        arg1[:skin_kv_upload_ids].each do |u|
          m = SkinKvUpload.find(u.to_i)          
          m.update_attributes(:kv_link => arg2[u.to_s]["kv_link"], :link_coords => arg2[u.to_s]["link_coords"])
        end
      end
    end
  end
end