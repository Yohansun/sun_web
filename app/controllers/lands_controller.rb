# -*- encoding : utf-8 -*-
class LandsController < ApplicationController
  def landing
    current_land = Rails.cache.fetch("landing-source-#{params[:source]}", expires_in: 1.day) do
      LandSource.find_by_code(params[:source])
    end

    if current_land.present? && current_land.path.present?
      redirect_to current_land.path
    else
      redirect_to root_path
    end
  end
end