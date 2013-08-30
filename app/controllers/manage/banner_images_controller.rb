#encoding: utf-8
class Manage::BannerImagesController < Manage::BaseController

	def index
  	@i_banner_groups = IBannerGroup.all
  	@i_banner_groups_count = @i_banner_groups.count

  	if params[:page_name]
	  	if params[:position]
	  		@i_banner = IBanner.page_name(params[:page_name]).position(params[:position]).first
	  	else
	  		@i_banner = IBanner.page_name(params[:page_name]).first
	  	end
	  else
	  	@i_banner = IBanner.page_name('图库首页').first
	  end
  end

  def create_image
  	position =  params[:position]
  	page_name = params[:page_name]
    @i_banner = IBanner.page_name(page_name).position(position).first
    result = "上传失败"
    if @i_banner
  		@i_banner.file = params[:file].tempfile if params[:file].present?
  		@i_banner.page_name = page_name
    	if @i_banner.save
    		if params[:file].present?
  				result = "上传成功"
  			end
  		end
    end

    render :json => {:notify => result}, :layout => false
  end

  def save_data
  	position = params[:position]
  	photo_name = params[:photo_name]
  	page_name = params[:page_name]
  	i_banner_group_id = params[:i_banner_group_id]

  	@i_banner = IBanner.page_name(page_name).position(position).first
  	if @i_banner
  		@i_banner.photo_name = photo_name
  		@i_banner.i_banner_group_id = i_banner_group_id
  	end

  	if @i_banner.save
  		render :json => {:result => "success"}, :layout => false
  	else
  		render :text => '未保存成功'
  	end
  end
end
