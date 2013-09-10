# encoding: utf-8
class Manage::LifeInfosController < Manage::BaseController
  def index
  	data_start = params[:data_start]
  	data_end = params[:data_end]
  	@title_id = params[:title_id]
  	@key = params[:key].strip if params[:key].present?

  	field = case @title_id
  		when "1"
  			:title
  		when "2"
  			:summary
  		else
  			:title
  	end

  	if data_start.blank? || data_end.blank? || @title_id.blank?
  		@i_life_infos = ILifeInfo.order("updated_at desc").page(params[:page]).per(5)
  	else
  		condition = ILifeInfo.arel_table[field].matches("%#{@key}%")
  		@i_life_infos = ILifeInfo.time_range(data_start, data_end).where(condition).order("updated_at desc").page(params[:page]).per(5)
  	end
  end

  def edit
  	p params
    @id = params[:id]
    @i_life_info = ILifeInfo.find_by_id(@id)

    render :partial => "edit"
  end

  def create
  	title = params[:title]
  	summary = params[:summary]
  	url = params[:url]
  	id = params[:id]

  	@i_life_info = ILifeInfo.new
  	@i_life_info.title = title
  	@i_life_info.url = url
  	@i_life_info.summary = summary
  	@i_life_info.file = params[:files] if params[:files].present?
  	if @i_life_info.save
			redirect_to request.referer if params[:files].present?
  		render :json => {notify: '上传成功', referer: request.referer}, :layout => false if params[:files].blank?
		else
			render :text => '上传失败'
		end
  end

  def update
  	title = params[:title]
  	summary = params[:summary]
  	url = params[:url]
  	id = params[:id]

  	@i_life_info = ILifeInfo.where(id: id).first
  	@i_life_info.title = title
  	@i_life_info.url = url
  	@i_life_info.summary = summary
  	@i_life_info.file = params[:files] if params[:files].present?
  	if @i_life_info.save
			redirect_to request.referer if params[:files].present?
  		render :json => {notify: '上传成功', referer: request.referer}, :layout => false if params[:files].blank?
		else
			render :text => '上传失败'
		end
  end

  def destroy
   	id = params[:id]
   	@i_life_info = ILifeInfo.find_by_id(id)
   	@i_life_info.file.destroy
   	@i_life_info.destroy
   	redirect_to "/manage/life_infos"
  end
end
