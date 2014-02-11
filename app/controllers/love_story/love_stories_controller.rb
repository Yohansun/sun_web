# encoding: utf-8
class LoveStory::LoveStoriesController < LoveStory::BaseController
  def index
    @love_stories = LoveStory.order("created_at DESC").page(params[:page]).per(12)

    @images_jx = IColumnData.show_data(2).limit(5)
    @images_jx_more = IColumnData.where(i_column_type_id: 2,position: 0).first
    @star_jx = IColumnData.show_data(3).limit(5)
    @star_jx_more = IColumnData.where(i_column_type_id: 3,position: 0).first
    @banners = IBanner.page_name('爱的故事').order("position ASC").all
  end

  def new

  end

  def create
    if current_user
      content = params[:love_story][:content]
      area_id = current_user.area_id
      user_name = current_user.display_name
      @love_story = LoveStory.create(content: content,user_id: current_user.id,area_id: area_id,user_name: user_name,come_from: 'icolor')

    else
      render js: "alert('请先登录!');" and return
    end

  end
end
