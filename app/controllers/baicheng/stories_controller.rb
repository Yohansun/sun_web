# encoding: utf-8
require 'zip/zip'
class Baicheng::StoriesController < ApplicationController
  layout 'baicheng'
  
  def index
    @title = "我来设计_挑选感兴趣房型图-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦icolor因爱之名刷新生活 我能设计活动，装修设计师上传设计作品，挑选感兴趣的房型图，获得更多装修需求机会。"
    @key_words = '设计作品,房型图,装修需求'
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
    @title = "我要装修_填写装修需求-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦icolor因爱之名刷新生活 我要装修活动，第一步装修者填写装修需求，免费获得家装设计。"
    @key_words = '刷新生活,装修者,装修需求,家装设计'
    
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
    @title = "我要装修_填写装修需求-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦icolor因爱之名刷新生活 我要装修活动，第二步装修者上传新房房型图，免费获得家装设计。"
    @key_words = '刷新生活,装修者,装修需求,家装设计'
    @upload = StoryImage.where(story_id: params[:id])
  end

  def update_image
    @title = "我要装修_提交装修需求-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦icolor因爱之名刷新生活 我要装修活动，装修者提交完成家装需求，将获得专业家装公司和设计师的家装创意方案。"
    @key_words = '家装公司,装修设计师,装修设计方案'
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
    @title = "我来设计_#{@story.user.display_name}房型图-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
    @description = "立邦icolor因爱之名刷新生活 我能设计活动，装修设计师选定房型图，您将看到其他想为您设计的家装公司和室内设计师。"
    @key_words = '立邦刷新生活,家装公司,室内设计师'

  end

  def act
    if current_user.present?
      @story_users = StoryUser.story_ids(current_user.id) if current_user.present?
      render :act
    else
      redirect_to baicheng_root_path
    end
  end

  def storyuser
    if params[:story_id] && params[:user_id]
      if check_storyuser(params)
        story_user = StoryUser.create(story_id: params[:story_id],user_id: params[:user_id],design_time: Time.now)
        render :js => "show_modal();"
      else
        user = StoryUser.where("user_id = ? and story_id = ?",params[:user_id],params[:story_id]).first
        if user.design_time + 15.days < Time.now
          user.design_time = Time.now
          user.save
          render :js => "show_modal();"
        else
          render :js => "alert('您已点过一次，不能再次点击!');"
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
