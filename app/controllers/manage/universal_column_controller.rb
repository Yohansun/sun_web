# encoding: utf-8
class Manage::UniversalColumnController < Manage::BaseController

  def index
  	column_type = params[:column_type]

  	@i_column_types = IColumnType.all
  	@i_column_type = IColumnType.where(id: column_type).first

  	@i_column_datas = []
  	@i_column_datas = IColumnData.where(i_column_type_id: column_type) if column_type.present?
  end

  def show
  	@column_type = params[:column_type]

  	@i_column_types = IColumnType.all
  	@i_column_type = IColumnType.where(id: @column_type).first

  	@i_column_data = IColumnData.where(i_column_type_id: @column_type, position: 0).first
  	@url = @i_column_data.url if @i_column_data

  	@i_column_datas = IColumnData.show_data(@column_type)
  	p @i_column_datas
  end

  def edit
    @id = params[:id]
    @i_column_data = IColumnData.find_by_id(@id)

    render :partial => "edit"
  end

  def create
  	title = params[:title]
  	url = params[:url]
  	id = params[:id]

  	@i_column_datas = IColumnData.show_data(id)
  	@i_column_datas.each do |item|
  		item.rank = item.rank + 1
  		item.save
  	end

  	if @i_column_datas.count == 5
  		@i_column_datas.first.destroy
  	end

  	@i_column_data = IColumnData.new
		@i_column_data.file = params[:files].tempfile if params[:files].present?
    @i_column_data.title = title
    @i_column_data.rank = 1
		@i_column_data.url = url
		@i_column_data.i_column_type_id = id
		if @i_column_data.save
			redirect_to request.referer if params[:files].present?
  		render :json => {notify: '上传成功', referer: request.referer}, :layout => false if params[:files].blank?
		else
			render :text => '上传失败'
		end
  end

  def update
  	@id = params[:id]
    rank = params[:rank]
    title = params[:title]
    url = params[:url]
    i_column_type_id = params[:i_column_type_id]

    @i_column_data = IColumnData.find_by_id(@id)
    result = "上传失败"
    if @i_column_data
  		@i_column_data.file = params[:files].tempfile if params[:files].present?
      @i_column_data.title = title
      @i_column_data.rank = rank
  		@i_column_data.url = url
    	if @i_column_data.save
    		result = "上传成功"
  		end

      @i_column_datas = IColumnData.show_data(i_column_type_id)
      rank_value = 5
	  	@i_column_datas.each do |item|
	  		unless @i_column_data == item
	  			if item.rank == rank.to_i
		  			rank_value -= 1
		  		end
		  		item.rank = rank_value
		  		item.save
	  		end
	  		rank_value -= 1
	  	end

    end

    @referer = request.referer

    if params[:files].present?
      redirect_to request.referer
    else
      render :json => {:notify => result}, :layout => false
    end
  end

  def save_data
  	id = params[:id]
  	url = params[:more_url]

  	result = "上传失败"
  
  	@i_column_data = IColumnData.find_or_create_by_i_column_type_id_and_position(id, 0)
  	@i_column_data.url = url
  	@i_column_data.position = 0
  	@i_column_data.i_column_type_id = id
  	if @i_column_data.save
  		result = "上传成功"
  		render :json => {notify: result, referer: request.referer}, :layout => false
  	else
  		render :text => result
  	end
  end

end
