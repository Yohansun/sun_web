# -*- encoding : utf-8 -*-
class LandsController < ApplicationController
  def landing

    Rails.logger.info "landing: #{params[:source]}, #{request.remote_ip}"

    current_land = LandSource.find_by_code(params[:source])
    if current_land.present? && current_land.path.present?
      redirect_to current_land.path
    else
      redirect_to root_path
    end
  end
end