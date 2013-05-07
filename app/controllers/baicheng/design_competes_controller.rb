# encoding: utf-8
class Baicheng::DesignCompetesController < ApplicationController
  layout 'baicheng'
  before_filter :find_user
  def index
    @images = StoryImage.order("created_at DESC")
    if params[:design]
      
    end
    if params[:area_id]
      @images = @images.so_area(params[:area_id])
    end
    if params[:tag]
      
    end
    if params[:cost]

    end
    if params[:soso]
      if params[:soso] == "so_user"
        @images = @images.so_user(params[:keywords]) if params[:keywords]
      else
        @images = @images..so_design(params[:keywords]) if params[:keywords]
      end
    end
    @designs = @images.page(params[:page]).per(24)
  end

  def show
    @design = StoryImage.find params[:id]
    @story_id = @design.story_id
    @story = Story.find @story_id
    @comments = StoryComment.where("story_id = ?", @story_id).order("created_at DESC").page(params[:page]).per(8)
  end

  def comment
    if params[:story_id] && params[:comment_id]
      if current_user
        ReStory.create!(user_id: current_user.id, story_comment_id: params[:comment_id], content: params[:content])
      else
        ReStory.create(story_comment_id: params[:comment_id], content: params[:content])
      end
    else
      Story.increment_counter(:comment_count, params[:story_id])
      if current_user
        StoryComment.create(user_id: current_user.id, story_id: params[:story_id], content: params[:content])
      else
        StoryComment.create(story_id: params[:story_id], content: params[:content])
      end
    end
    redirect_to design_compete_path(params[:story_id])
  end

  def destroy_comment
    comment = StoryComment.find params[:id]
    if comment.destroy
      redirect_to design_compete_path(params[:story_id])
    else
      render nothing: true, status: 404
    end
  end

  def download
    # target_file = Story.find params[:id]
    # unless target_file.blank?
    #   zipfile_name = "#{Rails.root}/public/design_competes#{params[:id]}.zip"
    #   if File.exists?(zipfile_name)
    #     send_file zipfile_name
    #   else
    #     Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
    #       if target_file.length == 1
    #         filename = target_file
    #         zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
    #       else
    #         target_file.each do |filename|
    #           zipfile.add(filename.file_file_name, filename.file.path) if File.exists?(filename.file.path)
    #         end
    #       end
    #     end
    #     send_file zipfile_name
    #   end
    # else
    #   redirect_to :back
    # end
    target_file = Story.find params[:id]
    if target_file
      send_file target_file.story_image.file.path
    else
      render nothing: true, status: 404
    end
  end

end