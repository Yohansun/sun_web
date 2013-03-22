# -*- encoding : utf-8 -*-
class MasterInterviewsController < ApplicationController
  before_filter :find_by_subject,:except => :show
  def index
    @articles = @articles.where(:master_kind => params[:master_kind]) unless params[:master_kind].blank?
  end

  def show
    @article = MasterProfile.find(params[:id])
  end
  
  def all
    render "index"
  end
  
  {:oversea => "海外",:hk_tw_mc => "港澳台",:cn => "中国大陆"}.each do |act,tag|
    define_method(act) do
      @articles = @articles.tagged_with(tag)
      render "index"
    end
  end
  
  private
  def find_by_subject
    @articles = Subject.content("master_profile").page(params[:page]).per(5)
  end
end
