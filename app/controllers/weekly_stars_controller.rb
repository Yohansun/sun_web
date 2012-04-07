# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  before_filter :get_designs

  def index
    @design = WeeklyStar.last
  end

  def show
    @design = WeeklyStar.find(params[:id])
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @design.comments.page params[:page]
  end

  def get_designs
    @designs = WeeklyStar.order("published_at desc")
  end

  def fullscreen
    @design = WeeklyStar.find(params[:id])
    render :layout => nil
  end
end
