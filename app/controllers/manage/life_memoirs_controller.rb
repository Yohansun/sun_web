# encoding: utf-8
class Manage::LifeMemoirsController < Manage::BaseController

  def index
  	data_start = params[:data_start]
  	data_end = params[:data_end]
  	@title_id = params[:title_id]
  	@key = params[:key].strip if params[:key].present?

  	field = case @title_id
  		when "1"
  			:title
  		when "2"
  			:s_title
  		when "3"
  			:summary
  		else
  			:title
  	end

  	if data_start.blank? || data_end.blank? || @title_id.blank?
  		@i_life_memoirs = ILifeMemoir.order("updated_at desc").page(params[:page]).per(4)
  	else
  		condition = ILifeMemoir.arel_table[field].matches("%#{@key}%")
  	@i_life_memoirs = ILifeMemoir.time_range(data_start, data_end).where(condition).order("updated_at desc").page(params[:page]).per(4)
  	end
  end

  def edit
  	p params
    @id = params[:id]
    @i_life_memoir = ILifeMemoir.find_by_id(@id)

    render :partial => "edit"
  end

  def create
  	title = params[:title]
  	s_title = params[:s_title]
  	summary = params[:summary]
  	url = params[:url]
  	id = params[:id]

  	@i_life_memoir = ILifeMemoir.new
  	@i_life_memoir.title = title
  	@i_life_memoir.s_title = s_title
  	@i_life_memoir.url = url
  	@i_life_memoir.summary = summary
  	@i_life_memoir.file = params[:files] if params[:files].present?
    if params[:video].present? && params[:video].original_filename
      @i_life_memoir.video = params[:video]
      @i_life_memoir.video_name = params[:video].original_filename
    end
  	if @i_life_memoir.save
			redirect_to request.referer if params[:files].present? || params[:video].present?
  		render :json => {notify: '上传成功', referer: request.referer}, :layout => false if params[:files].blank? && params[:video].blank?
		else
			render :text => '上传失败'
		end
  end

  def update
  	title = params[:title]
  	s_title = params[:s_title]
  	summary = params[:summary]
  	url = params[:url]
  	id = params[:id]

  	@i_life_memoir = ILifeMemoir.where(id: id).first
  	@i_life_memoir.title = title
  	@i_life_memoir.s_title = s_title
  	@i_life_memoir.url = url
  	@i_life_memoir.summary = summary
  	@i_life_memoir.file = params[:files] if params[:files].present?
    if params[:video].present? && params[:video].original_filename
    	@i_life_memoir.video = params[:video]
      @i_life_memoir.video_name = params[:video].original_filename
    end
  	if @i_life_memoir.save
			redirect_to request.referer if params[:files].present? || params[:video].present?
  		render :json => {notify: '上传成功', referer: request.referer}, :layout => false if params[:files].blank? && params[:video].blank?
		else
			render :text => '上传失败'
		end
  end

  def destroy
   	id = params[:id]
   	@i_life_memoir = ILifeMemoir.find_by_id(id)
   	@i_life_memoir.file.destroy
   	@i_life_memoir.video.destroy
   	@i_life_memoir.destroy
   	redirect_to "/manage/life_memoirs"
  end

end
