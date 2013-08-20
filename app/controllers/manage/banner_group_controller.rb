#encoding: utf-8
class Manage::BannerGroupController < Manage::BaseController

  def index
  	@i_banner_groups = IBannerGroup.all
  end

  def save_data
  	name = params[:name]
  	i_banner_group_id = params[:i_banner_group_id]

  	if name.blank?
	  	render :text => '保存失败! 组名不允许为空。' 
	  	return false
	  end

	  @i_banner_group = IBannerGroup.find_by_name(name)
	  if @i_banner_group
	  	render :text => '保存失败! 已存在相同的组名。' 
	  	return false
	  end

  	i_banner_group_count = IBannerGroup.count
  	if i_banner_group_count >= 6
	  	render :text => '上传失败! 已达到6个组上限。'
	  	return false
	  end

	  @i_banner_group = IBannerGroup.new
		@i_banner_group.name = name
  	if @i_banner_group.save
  		render :json => {:result => "success"}, :layout => false
  	else
  		render :text => '未保存成功'
  	end

  end

  def destroy
   	id = params[:id]
   	@i_banner_group = IBannerGroup.find_by_id(id)
   	if @i_banner_group.i_banners.count == 0
	   	@i_banner_group.destroy
	   	render :json => {:result => "success"}, :layout => false
	  else
	  	render :json => {:result => "error"}, :layout => false
	  end
  end

end
