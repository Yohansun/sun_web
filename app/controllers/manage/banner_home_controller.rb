#encoding: utf-8
class Manage::BannerHomeController < Manage::BaseController

  def index
  	position =  params[:position]
    position = 1 if params[:position].blank?

  	@i_banner_groups = IBannerGroup.all
  	@i_banner_groups_count = @i_banner_groups.count

  	@i_banner = IBanner.page_name('首页').position(position).first
  end

  def create_image
  	position =  params[:position]
    @i_banner = IBanner.page_name('首页').position(position).first
    result = "上传失败"
    if @i_banner
  		@i_banner.file = params[:file].tempfile if params[:file].present?
  		@i_banner.page_name = '首页'
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
    url = params[:url]
  	i_banner_group_id = params[:i_banner_group_id]

  	@i_banner = IBanner.page_name('首页').position(position).first
  	if @i_banner
  		@i_banner.photo_name = photo_name
      @i_banner.url = url
  		@i_banner.i_banner_group_id = i_banner_group_id
  	end

  	if @i_banner.save
  		render :json => {:result => "success"}, :layout => false
  	else
  		render :text => '未保存成功'
  	end
  end

end
