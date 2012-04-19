# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  def index
    @design = WeeklyStar.last || WeeklyStar.new
    @elder_designs ||= WeeklyStar.order("created_at desc").offset(1).all
    @color1 = ColorCode.find_by_code(@design.recommend_color1)
    @color2 = ColorCode.find_by_code(@design.recommend_color2)
    @color3 = ColorCode.find_by_code(@design.recommend_color3)
  end

  def show
    @design = WeeklyStar.find(params[:id])
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @design.comments.page params[:page]
    @color1 = ColorCode.find_by_code(@design.recommend_color1)
    @color2 = ColorCode.find_by_code(@design.recommend_color2)
    @color3 = ColorCode.find_by_code(@design.recommend_color3)
  end

  def fullscreen
    @design = WeeklyStar.find(params[:id])
    render :layout => nil
  end

end
