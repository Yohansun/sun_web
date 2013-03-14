# encoding: utf-8
class Baicheng::StoriesController < ApplicationController
  layout 'baicheng'
  def index
    @event_data = BaichengEvent.by_type(Story.name).order('created_at DESC').page(params[:page]).per(28)
    if params[:unload].present?
      @xx = BaichengEvent.baicheng_map_story(825)
      @lf = BaichengEvent.baicheng_map_story(647)
      @dt = BaichengEvent.baicheng_map_story(1046)
      @sjz = BaichengEvent.baicheng_map_story(661)
      @ly = BaichengEvent.baicheng_map_story(855)
    else
      @xx = BaichengEvent.story_type(825)
      @xx2 = BaichengEvent.design_type(825)
      @lf = BaichengEvent.story_type(647)
      @lf2 = BaichengEvent.design_type(647)
      @dt = BaichengEvent.story_type(1046)
      @dt2 = BaichengEvent.design_type(1046)
      @sjz = BaichengEvent.story_type(661)
      @sjz2 = BaichengEvent.design_type(661)
      @ly = BaichengEvent.story_type(855)
      @ly2 = BaichengEvent.design_type(855)
    end

  end

  def new
    if current_user
      @story = Story.new
      @story_image = StoryImage.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user
      tags = []
      tags << params[:apartment] if params[:apartment].present?
      tags += params[:style] if params[:style].present?
      tags += params[:fee] if params[:fee].present?
      tags += params[:acreage] if params[:acreage].present?
      tags += params[:throng] if params[:throng].present?
      story = Story.new(params[:story])
      story.user_id = current_user.id
      if story.save
        params[:story_image_ids].each do |story_image_id|
          story_image = StoryImage.find(story_image_id)
          story_image.story_id = story.id
          story_image.is_cover = true if params[:cover_image] && params[:cover_image].to_i == story_image_id.to_i
          if story_image.save
            tags.each do |tag|
              StoryImageTag.create(image_library_category_id: tag, story_image_id: story_image.id)
            end
          end
        end
        redirect_to stories_path(mode: "grid")
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
  	@story = Story.find(params[:id])
  	@stories = Story.where(parent_id: @story.id).limit(3)
  end

  def download
    target_file = StoryImage.where(:story_id => params[:id])
    unless target_file.blank?
	    target_file.each do |t|
	      system("zip public/design#{params[:id]}.zip -j #{t.file.path} ")
	    end
      send_file "public/design#{params[:id]}.zip"
      # system("rm public/design#{params[:id]}.zip")
    else
      redirect_to :back
    end
  end
end
