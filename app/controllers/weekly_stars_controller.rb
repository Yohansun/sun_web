# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  def index
    @design = WeeklyStar.last || WeeklyStar.new
    elder_designs ||= WeeklyStar.find(:all, :order => "created_at desc", :offset => 1)
    unless elder_designs.blank?
      @elder_designs = elder_designs.page(params[:page]).per(8)
    else
      @elder_designs = ""
    end
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
