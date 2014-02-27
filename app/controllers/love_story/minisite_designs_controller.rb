# encoding: utf-8
class LoveStory::MinisiteDesignsController < LoveStory::BaseController

  def index
    @minisite_designs = Design.minisite_designs.order("created_at DESC")

    if params[:city_id].present?
      area = Area.find_by_id(params[:city_id])
      if area
        area_ids = area.children.map(&:id)
        @minisite_designs = @minisite_designs.where(area_id: area_ids)
      end
    end

    if params[:province_id].present? && params[:city_id].blank?
      area = Area.find_by_id(params[:province_id])
      if area
        area_ids = area.descendants.map(&:id)
        @minisite_designs = @minisite_designs.where(area_id: area_ids)
      end
    end

    if params[:title].present?
      @minisite_designs = @minisite_designs.where(["title LIKE ?", "%#{params[:title]}%"])
    end

    @minisite_designs = @minisite_designs.page(params[:page]).per(12)

    @images_jx = IColumnData.show_data(2).limit(5)
    @images_jx_more = IColumnData.where(i_column_type_id: 2,position: 0).first
    @star_jx = IColumnData.show_data(3).limit(5)
    @star_jx_more = IColumnData.where(i_column_type_id: 3,position: 0).first
    @banners = IBanner.page_name('设计作品展示').order("position ASC").all
  end
end
