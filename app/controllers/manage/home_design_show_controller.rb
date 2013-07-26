#encoding: utf-8
class Manage::HomeDesignShowController < Manage::BaseController

  def index
  	@design_type = params[:design_type] || 1
  	@home_design_shows = HomeDesignShow.where("position <> 0 AND design_type=?", @design_type)
  end

  def edit
  	home_design_show_id = params[:home_design_show_id]
  	@design_type = params[:design_type]
  	@home_design_show = HomeDesignShow.find_by_id(home_design_show_id)
  	@home_design_show_title = HomeDesignShow.where(position: 0, design_type: @design_type).first
  	@title = @home_design_show_title.title if @home_design_show_title.present?

  	render :partial => "edit_show"
  end

  def create_image
  	design_type =  params[:design_type]
  	@home_design_show = HomeDesignShow.new
		@home_design_show.file = params[:file].tempfile if params[:file].present?
		@home_design_show.design_type = design_type
		@home_design_show.position = -1
  	if @home_design_show.save
  		if params[:file].present?
				render :json => {:result => "success"}, :layout => false
			end
		else
			render :json => {:result => "error"}, :layout => false
		end
  end

  def save_data
  	title = params[:title]
  	design_id = params[:design_id]
  	@home_design_show = HomeDesignShow.find_by_id(design_id)
  	@home_design_show.url = params[:url]
  	@home_design_show.vote = params[:vote]
  	@home_design_show.position = params[:position]
  	if @home_design_show.save
  		@home_design_show_design_type = HomeDesignShow.find_or_create_by_position_and_design_type(0, @home_design_show.design_type)
  		@home_design_show_design_type.title = title
  		if @home_design_show_design_type.save
				render :json => {:result => "success"}, :layout => false
			else
				render :text => '错误'
			end
		else
			render :text => '错误'
		end
  end

  def destroy
   	id = params[:id]
   	@home_design_show = HomeDesignShow.find_by_id(id)
   	@home_design_show.file.destroy
   	@home_design_show.destroy
   	redirect_to "/manage/home_design_show"
  end

end
