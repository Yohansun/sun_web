class Huaxun::HomesController < ApplicationController
  layout 'huaxun'
  before_filter :is_sign, :only => [:index,:new_phone]
  def index
    @phone = Phone.first
  end

  def new_phone
    phone = Phone.first
    unless phone.present?
      phone = Phone.new
    end
    phone.phone = params[:phone]
    phone.genre = params[:genre]
    phone.save
    redirect_to homes_path
  end

  def login
    redirect_to homes_path if current_user && current_user.genre == 'huaxun'
  end
end
