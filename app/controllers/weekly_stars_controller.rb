# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  def index
    @design = WeeklyStar.last || WeeklyStar.new
    @elder_designs = WeeklyStar.order("published_at desc").offset(1).page(params[:page]).per(8).padding(1)
  end

  def show
    @design = WeeklyStar.find(params[:id])
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @design.comments.page params[:page]

    @prev_star = WeeklyStar.where("id < ?", @design.id).last
    @next_star = WeeklyStar.where("id > ?", @design.id).first
  end

  def fullscreen
    @design = WeeklyStar.find(params[:id])
    render :layout => nil
  end
end