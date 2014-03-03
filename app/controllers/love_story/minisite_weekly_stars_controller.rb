# encoding: utf-8
class LoveStory::MinisiteWeeklyStarsController < LoveStory::BaseController

  def index
    @minisite_weekly_stars = Design.joins(:user,:design_images).where(:users => {:top500 => true}).group("designs.user_id").order("designs.id DESC")
    if params[:style].present?
      @minisite_weekly_stars = @minisite_weekly_stars.where(:designs => {:style => params[:style]})
    end
    if params[:price].present?
      @minisite_weekly_stars = @minisite_weekly_stars.where(:users => {:price => params[:price]})
    end

    if params[:area_id].present?
      area_ids = Area.find_by_id(params[:area_id]).self_and_descendants.map(&:id)
      @minisite_weekly_stars = @minisite_weekly_stars.where(:designs => {:area_id => area_ids})
    elsif params[:area_head].present?
      area_ids = []
      areas = Area.where(parent_id: params[:area_head])
      areas.each {|area| area_ids << area.self_and_descendants.map(&:id)}
      area_ids.flatten!
      @minisite_weekly_stars = @minisite_weekly_stars.where(:designs => {:area_id => area_ids}) if area_ids.present?
    end

    @minisite_weekly_stars = @minisite_weekly_stars.page(params[:page]).per(12)

    @images_jx = IColumnData.show_data(2).limit(5)
    @images_jx_more = IColumnData.where(i_column_type_id: 2,position: 0).first
    @star_jx = IColumnData.show_data(3).limit(5)
    @star_jx_more = IColumnData.where(i_column_type_id: 3,position: 0).first
    @banners = IBanner.page_name('设计师精选-iColor设计之星').order("position ASC").all
  end
end
