# -*- encoding : utf-8 -*-
class WeeklyStarsController < ApplicationController

  helper_method :star_blank?
 
  def download
    target_file = WeeklyStar.find(params[:id])
      if target_file
        send_file target_file.main_preview_img.path
      else
        render nothing: true, status: 404
      end
     
  end
  def index
    @title1,@title2 = "每周","之星"

    designs = WeeklyStar.order("published_at desc") || WeeklyStar.new
    star_type_id = WeeklyStar.get_star_type_id(@title="每周之星")

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
  
  {:weekly_stars_week 			    => "每周之星",
    :weekly_stars_month_color 	=> "月度色彩之星",
    :weekly_stars_month_design 	=> "月度设计之星"}.
    each do |act,star_type|
      define_method(act) do
        #TODO
        star_type_id = WeeklyStar.get_star_type_id(star_type)
        #每周之星
        @design = WeeklyStar.order("published_at desc").find_by_star_type_id(star_type_id)
        design_id = @design.design_link.split("/").last
        @link_design = Design.find(design_id)

        @elder_designs = WeeklyStar.where("id != ?", @design.id).order("published_at desc").page(params[:page]).per(8) 
        @title = @title1 = star_type.dup
        @title1.delete!(@title2="之星")
        render "index"
      end
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
