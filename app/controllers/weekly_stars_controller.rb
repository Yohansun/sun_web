# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  def index
    @design = WeeklyStar.order("published_at desc").first || WeeklyStar.new
    @elder_designs = WeeklyStar.order("published_at desc").offset(1).page(params[:page]).per(8).padding(1)
  end

  def show
    @design = WeeklyStar.find(params[:id])
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @design.comments.page params[:page]

    @prev_star = WeeklyStar.where("published_at < ?", @design.published_at).order("published_at desc").first
    @next_star = WeeklyStar.where("published_at > ?", @design.published_at).order("published_at desc").last
  end

  def fullscreen
    @design = WeeklyStar.find(params[:id])
    @design_next = WeeklyStar.where("id > ?",params[:id]).first
    render :layout => nil
  end
end
