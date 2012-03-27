# -*- encoding : utf-8 -*-
module MagicContent
  class MasterProfilesController < BaseController
    belongs_to :subject

    def create
      @banner = MasterProfile.new(rebuild_params(params[:master_profile]))
      create! do |success, failure|
        failure.html { render :action => 'new' }
        success.html { redirect_to  subject_master_profiles_path }
      end
    end

    def update
      params[:master_profile] = rebuild_params(params[:master_profile])
      update! do |success, failure|
        failure.html { render :action => 'edit' }
        success.html { redirect_to  subject_master_profiles_path }
      end
    end
  end
end