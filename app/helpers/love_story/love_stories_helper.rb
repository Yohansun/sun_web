module LoveStory::LoveStoriesHelper
  def is_data(user_id)
    love_story = LoveStory.where(user_id: user_id)
    if love_story.present?
      return true
    else
      return false
    end
  end
end
