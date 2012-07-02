# -*- encoding : utf-8 -*-
module MagicAdmin
  class SellerUsersController < MagicAdmin::BaseController
  	action :all, :except => [:show]

  	def create
  		create! { main_app.seller_users_path }
  	end

  	def update
  		update! { main_app.seller_users_path }
  	end	

  	def destroy
  		destroy!{ main_app.seller_users_path }
  	end

    def autocomplete_area
      areas = Area.select("id,name,parent_id").where("name LIKE ?", "%#{params[:q]}%").all.map {
        |a| a.name + ":" + a.id.to_s }
        render :text => areas.join("\n")
    end 
  end	
end