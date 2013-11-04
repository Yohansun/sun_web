# encoding: utf-8
class Huaxun::HxProfilesController < Huaxun::BaseController

  def index
    @hx_profile = HxProfile.first
    @hx_profile = HxProfile.create if @hx_profile.nil?
  end

  def update
    @hx_profile = HxProfile.find(params[:id])
    @hx_profile.update_attribute(:content,params[:content]) unless @hx_profile.nil?
    redirect_to hx_profiles_path, notice: '保存成功!'
  end
end
