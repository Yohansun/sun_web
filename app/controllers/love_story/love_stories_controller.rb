# encoding: utf-8
class LoveStory::LoveStoriesController < LoveStory::BaseController
  def index
    @love_stories = LoveStory.all
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
