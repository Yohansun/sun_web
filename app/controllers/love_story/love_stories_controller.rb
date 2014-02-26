# encoding: utf-8
class LoveStory::LoveStoriesController < LoveStory::BaseController
  def index
    @love_stories = LoveStory.order("created_at DESC")

    if params[:city_id].present?
      area = Area.find_by_id(params[:city_id])
      if area
        area_ids = area.children.map(&:id)
        @love_stories = @love_stories.where(area_id: area_ids)
      end
    end

    if params[:province_id].present? && params[:city_id].blank?
      area = Area.find_by_id(params[:province_id])
      if area
        area_ids = area.descendants.map(&:id)
        @love_stories = @love_stories.where(area_id: area_ids)
      end
    end

    if params[:come_from].present?
      @love_stories = @love_stories.where(come_from: params[:come_from])
    end

    if params[:user_name].present?
      @love_stories = @love_stories.where(["user_name LIKE ?", "%#{params[:user_name]}%"])
    end

    @love_stories = @love_stories.page(params[:page]).per(12)

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
      params[:story_image_ids].each do |story_image_id|
        story_image = LoveStoryImage.find story_image_id
        story_image.love_story_id = @love_story.id
        story_image.save
      end

    else
      render js: "alert('请先登录!');" and return
    end

  end

  def get_story_info
    if params[:love_story_id].present?
      @love_story = LoveStory.find_by_id(params[:love_story_id])
      @love_story_user = User.find_by_id(@love_story.user_id)
    else
      render nothing: true
    end
  end

end
