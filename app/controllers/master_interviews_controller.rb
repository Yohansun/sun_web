# -*- encoding : utf-8 -*-
class MasterInterviewsController < ApplicationController
  layout "home_manage"
  before_filter :find_by_subject,:except => :show
  def index
    @articles = @articles.where(:master_kind => params[:master_kind]) unless params[:master_kind].blank?

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end

  def show
    @article = MasterProfile.find(params[:id])

    expires_in 60.minutes, 'max-stale' => 2.hours, :public => true
  end
  
  def all
    render "index"
  end
  
  {:oversea => "海外",:hk_tw_mc => "港澳台",:cn => "中国大陆"}.each do |act,tag|
    define_method(act) do
      hash = {"shinei" => "室内空间大师","color" => "色彩大师"}
      condition = hash.keys.include?(type = params[:type]) ? {:master_kind => hash[type]} : nil
      @articles = @articles.tagged_with(tag).where(condition)
      render "index"
    end
  end
  
  private
  def find_by_subject
    @articles = Subject.content("master_profile").page(params[:page]).per(5)
  end
end
