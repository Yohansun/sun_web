# encoding: utf-8
require 'zip/zip'
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
    @title = "上传icolor“刷新百城”设计案例征集评选设计作品-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "上传立邦icolor刷新百城设计案例征集评选活动设计师作品。"
    
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
  	#@stories = Story.where(parent_id: @story.id).limit(3)
      @designs = Design.where(story_id: @story.id).limit(3)
  end

  def download
    target_file = StoryImage.where(:story_id => params[:id])
    unless target_file.blank?
      zipfile_name = "#{Rails.root}/public/design#{params[:id]}.zip"
      if File.exists?(zipfile_name)
        send_file zipfile_name
      else
        Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
          target_file.each do |filename|
            zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
          end
        end
        send_file zipfile_name
      end
    else
      redirect_to :back
    end
  end
end
