# encoding: utf-8
class Baicheng::DesignCompetesController < ApplicationController
  layout 'baicheng'
  before_filter :find_user
  # before_filter :get_tags, :only => [:index]
  def index
     
    
    @desgins = Design.baicheng.includes(:cover_img).order("created_at DESC")
    province_id,city_id,area_id = params[:province_id].or(nil),params[:city_id].or(nil),params[:area_id].or(nil)
    area_ids =[]
    if area_id.present?
      area_ids  = [area_id]
    elsif province_id.present?
      area_ids   = Area.robot(province_id,[city_id].compact).map(&:id)
    end
    
    unless area_ids.empty?
      Rails.logger.info area_ids
      @desgins =  @desgins.where(area_id: area_ids)
    end
    
    if params[:tag].present? 
      @desgins = @desgins.joins(:design_tags).where("design_tags.image_library_category_id = ?", params[:tag])
    end
    if params[:cost].present?
      @desgins = @desgins.joins(:design_tags).where("design_tags.image_library_category_id = ?", params[:cost])
    end
    if params[:style].present?
      @desgins = @desgins.joins(:design_tags).where("design_tags.image_library_category_id = ?", params[:style])
    end
    
    if params[:keywords].present?
      if params[:soso] == "so_user"
        @desgins = Design.baicheng.includes(:cover_img).order("created_at DESC").joins(:user).where("users.username=?", params[:keywords]) if params[:keywords].present?
      else
        @desgins = Design.baicheng.includes(:cover_img).order("created_at DESC").where("title=?", params[:keywords]) if params[:keywords].present?
      end
    end
    @designs = @desgins.page(params[:page]).per(24).limit(2)
  end

  def show
    @design = Design.baicheng.find params[:id]
    @story_id = @design.story_id
    @story = Story.where(id: @story_id).first
    
 	  @design_images = @design.design_images.available
  	@image_colors = []
  	@design_images.each do |image|
  		@image_colors << ColorCode.where("code in (?)", [image.color1, image.color2, image.color3])
  	end
 
    @comments = @design.comments.page(params[:page]).per(8)
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
      if File.exists?(target_file.story_image.file.path)
        send_file target_file.story_image.file.path
      else
        render nothing: true, status: 404
      end
    else
      render nothing: true, status: 404
    end
  end

  def get_tags
    @tags = []
    @tags << {:title => "户型", :id => ""}
    ImageLibraryCategory.where(parent_id: 1).each do |tag|
      @tags << {title: tag.title, id: tag.id }
    end
  end

end