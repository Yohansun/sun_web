# encoding: utf-8
class LoveStory::MinisiteDesignsController < LoveStory::BaseController

  def index
    @images_jx = IColumnData.show_data(2).limit(5)
    @images_jx_more = IColumnData.where(i_column_type_id: 2,position: 0).first
    @star_jx = IColumnData.show_data(3).limit(5)
    @star_jx_more = IColumnData.where(i_column_type_id: 3,position: 0).first
    @banners = IBanner.page_name('设计作品展示').order("position ASC").all
  end
end
