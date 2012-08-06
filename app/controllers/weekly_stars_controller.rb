# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  helper_method :star_blank?

  def index
    params[:star_type] ||= "每周之星"

    designs = WeeklyStar.order("published_at desc") || WeeklyStar.new
    star_type_id = WeeklyStar.get_star_type_id params[:star_type]

    @design = designs.where(star_type_id: star_type_id).first    
    design_id = @design.design_link.split("/").last
    @link_design = Design.find(design_id)

    #每周之星
    weekly_star = designs.where(star_type_id: 1).first

    # star_ids = []
    # 3.times do |t|
    #   star = WeeklyStar.where(star_type_id: t+1).order("published_at desc").first
    #   star_ids << star.id if star.present?
    # end  
    @elder_designs = WeeklyStar.where("id != ?", weekly_star.id).order("published_at desc").page(params[:page]).per(8)
  end

  def show
    @design = WeeklyStar.find(params[:id])
    design_id = @design.design_link.split("/").last
    @link_design = Design.find design_id
    @tags = WeeklyStar.tag_counts_on(:tags)
    @comments = @link_design.comments.page params[:page]

    @prev_star = WeeklyStar.where("published_at < ?", @design.published_at).order("published_at desc").first
    @next_star = WeeklyStar.where("published_at > ?", @design.published_at).order("published_at desc").last
  end

  def fullscreen
    @design = WeeklyStar.find(params[:id])
    @design_next = WeeklyStar.where("id > ?",params[:id]).first
    render :layout => nil
  end

  def star_blank?(star_type)
    star_type_id = WeeklyStar.get_star_type_id star_type
    WeeklyStar.where(star_type_id: star_type_id).blank?
  end  
end
