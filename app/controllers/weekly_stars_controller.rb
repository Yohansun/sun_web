# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  def index
    @design = WeeklyStar.last || WeeklyStar.new
    @elder_designs = WeeklyStar.order("published_at desc").offset(1)
  end

  def show
    @design = WeeklyStar.find(params[:id])
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @design.comments.page params[:page]
  end

  def fullscreen
    @design = WeeklyStar.find(params[:id])
    render :layout => nil
  end
end
