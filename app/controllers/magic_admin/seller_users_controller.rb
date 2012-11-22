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

    def seller_add_user
      area_id = []
      area_id = Area.where(parent_id: params[:area_id]).map &:id
      area_id << params[:area_id]
      @user = User.where("role_id = ? and area_id in (?)",2,area_id)
      seller_user = SellerUser.find params[:seller_id]
      @user_ids = []
      if seller_user.user_ids.present?
        user_ids = seller_user.user_ids.split(',')
        @user_ids = user_ids
      end
    end

    def create_seller_user_id
      
      seller_user = SellerUser.find params[:seller_user_id]
      if params[:user_ids].present?
        user_ids = ""
        params[:user_ids].each do |user_id|
           user_ids +=  user_id + "," 
        end
        seller_user.user_ids = user_ids
      else
        seller_user.user_ids = nil
      end
      if seller_user.save!
        redirect_to main_app.seller_users_path
      end
    end
  end	
end