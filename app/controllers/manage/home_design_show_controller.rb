#encoding: utf-8
class Manage::HomeDesignShowController < Manage::BaseController

  def index
  	@design_type = params[:design_type] || 1
  	@home_design_shows = HomeDesignShow.where("position <> 0 AND design_type=?", @design_type)
  end

  def edit
  	home_design_show_id = params[:home_design_show_id]
  	@design_type = params[:design_type]
    @index_id = params[:index_id]
  	@home_design_show = HomeDesignShow.find_by_id(home_design_show_id)
  	@home_design_show_title = HomeDesignShow.where(position: 0, design_type: @design_type).first
  	@title = @home_design_show_title.title if @home_design_show_title.present?

    @design_type_next = @design_type.to_i + 1
    @design_type_next = 1 if @design_type_next > 3

  	render :partial => "edit_show"
  end

  def create_image
  	design_type =  params[:design_type]
    @home_design_show_count = HomeDesignShow.where(design_type: design_type).where("position <> 0").count
    if @home_design_show_count < 4
    	@home_design_show = HomeDesignShow.new
  		@home_design_show.file = params[:file] if params[:file].present?
  		@home_design_show.design_type = design_type
  		@home_design_show.position = -1
    	if @home_design_show.save
    		if params[:file].present?
  				render :json => {:notify => "上传成功"}, :layout => false
  			end
  		else
  			render :json => {:notify => "上传失败"}, :layout => false
  		end
    else
      render :json => {:notify => "上传图片最多4张"}, :layout => false
    end
  end

  def save_data
  	title = params[:title]
  	design_id = params[:design_id]
    position = params[:position]
  	@home_design_show = HomeDesignShow.find_by_id(design_id)
    @hds_count = HomeDesignShow.where(design_type: @home_design_show.design_type, position: position).count
    if (@hds_count == 0) || ((@home_design_show.position.to_s == position.to_s) && @hds_count < 2)
    	@home_design_show.url = params[:url]
    	@home_design_show.vote = params[:vote]
    	@home_design_show.position = position
    	if @home_design_show.save
    		@home_design_show_design_type = HomeDesignShow.find_or_create_by_position_and_design_type(0, @home_design_show.design_type)
    		@home_design_show_design_type.title = title
    		if @home_design_show_design_type.save

          home_index_page = "#{Rails.root.to_s}/public/index.html"
          if File.exist?(home_index_page)
            File.delete(home_index_page)
          end

  				render :json => {:result => "success"}, :layout => false
  			else
  				render :text => '未保存成功'
  			end
  		else
  			render :text => '未保存成功'
  		end
    else
      render :text => '存在相同位置'
    end
  end

  def destroy
    design_type = params[:design_type]
   	id = params[:id]
   	@home_design_show = HomeDesignShow.find_by_id(id)
   	@home_design_show.file.destroy
   	@home_design_show.destroy
   	redirect_to "/manage/home_design_show?design_type=#{design_type}"
  end

end
