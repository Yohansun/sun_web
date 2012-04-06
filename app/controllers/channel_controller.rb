class ChannelController < ApplicationController
  #片区快查
  def access  
    @design_users = User.where("name like ? or username like ?", "%" + params[:keywords].to_s + "%", "%" + params[:keywords].to_s + "%")
    @design_users = @design_users.where(:area_id => params[:area_id]) unless params[:area_id].blank?
    @design_users = @design_users.where(:des_status => params[:des_status]) unless params[:des_status].blank?
    @design_users = @design_users.page(params[:page])
  end

end
