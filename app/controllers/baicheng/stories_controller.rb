# encoding: utf-8
require 'zip/zip'
class Baicheng::StoriesController < ApplicationController
  layout 'baicheng'
  def index
    params[:search] ||= {}

    province_id,city_id,area_id = params[:province_id].or(nil),params[:city_id].or(nil),params[:area_id].or(nil)

    if area_id.present?
      params[:search][:area_id_eq] = area_id
    elsif province_id.present?
      params[:search][:area_id_in] = Area.robot(province_id,[city_id].compact).map(&:id)
    end

    @search = Story.search(params[:search])
    @stories = @search.where(:is_save => true)
    if params[:sort].present?
        case params[:sort]
        when 'hot'
          @search_sort = @search.order("stories.designs_count")
        when 'new_chance'
          @search_sort = @search.order("stories.designs_count desc")
        else
          @search_sort = @search
        end
        @stories = @search_sort.where(:is_save => true)
    end
    @stories = @stories.order("stories.created_at desc").page(params[:page]).per(24)
  end

  def new
    @title = "上传icolor“刷新百城”设计案例征集评选设计作品-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "上传立邦icolor刷新百城设计案例征集评选活动设计师作品。"
    
    if current_user
      if params[:id].present?
        @story = Story.find params[:id]
      else
        @story = Story.new
      end
    else
      redirect_to baicheng_root_path
    end
  end

  def create
    if current_user
      tags = []
      tags << params[:apartment] if params[:apartment].present?
      tags += params[:style] if params[:style].present?
      tags += params[:acreage] if params[:acreage].present?
      tags += params[:room] if params[:room].present?
      if params[:stroy_id].present?
        story = Story.find(params[:stroy_id])
      else
        story = Story.new(params[:story])
      end
      story.user_id = current_user.id
      story.budget =  params[:fee] if params[:fee].present?
      if story.save
        tags.each do |tag|
          StoryImageTag.create(image_library_category_id: tag, story_image_id: story.id)
        end
        redirect_to image_new_story_path(story)
      else
        render :new
      end
    else
      redirect_to baicheng_root_path
    end
  end

    def update
    if current_user
      tags = []
      tags << params[:apartment] if params[:apartment].present?
      tags += params[:style] if params[:style].present?
      tags += params[:acreage] if params[:acreage].present?
      tags += params[:room] if params[:room].present?
      story = Story.find(params[:stroy_id])
      story.user_id = current_user.id
      story.budget =  params[:fee] if params[:fee].present?
      if story.save
        sit = StoryImageTag.where(story_image_id: story.id)
        if sit.present?
          sit.each do |s|
            s.destroy
          end
        end
        tags.each do |tag|
          StoryImageTag.create(image_library_category_id: tag, story_image_id: story.id)
        end
        redirect_to image_new_story_path(story)
      else
        render :new
      end
    else
      redirect_to baicheng_root_path
    end
  end

  def image_new
    @upload = StoryImage.where(story_id: params[:id])
  end

   def update_image
    story_image = StoryImage.find params[:story_image_id]
    story_image.story_id = params[:story_id]
    story_image.is_cover = true
    if story_image.save  
      @story = Story.find params[:story_id]
      @story.is_save = true
      @story.save
    else
      render :image_new
    end
  end

  def show
    @story = Story.find(params[:id])
    @story_image = @story.story_image
    @comments = @story.comments.page(params[:page]).per(4)
    @story_users = StoryUser.where(story_id: @story).order("design_time desc").limit(6)
  end

  def act
    if current_user.present?
      @designs = current_user.designs.where("designs.story_id is not null or designs.story_id <> '' ")
      render :act
    else
      redirect_to baicheng_root_path
    end
  end

  def storyuser
    if params[:story_id] && params[:user_id]
      if check_storyuser(params)
        story_user = StoryUser.create(story_id: params[:story_id],user_id: params[:user_id],design_time: Time.now)
        render :js => "alert('预定成功!');"
      else
        user = StoryUser.where("user_id = ? and story_id = ?",params[:user_id],params[:story_id]).first
        if user.design_time + 15.days < Time.now
          user.design_time = Time.now
          user.save
          render :js => "alert('时间过期重新预定!');"
        else
          render :js => "alert('您已经预定过了!');"
        end
      end
    else
      render nothing: true
    end
  end

  def download
    target_file = StoryImage.where(:story_id => params[:id])
    unless target_file.blank?
      zipfile_name = "#{Rails.root}/public/system/zip/story#{params[:id]}.zip"
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

  private

  def check_storyuser(params)
    user = StoryUser.where("user_id = ? and story_id = ?",params[:user_id],params[:story_id])
    if user.blank?
      return true
    else
      return false
    end
  end
end
