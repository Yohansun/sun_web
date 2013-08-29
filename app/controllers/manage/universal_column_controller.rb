# encoding: utf-8
class Manage::UniversalColumnController < Manage::BaseController

  def index
  	p params
  	column_type = params[:column_type]

  	@i_column_types = IColumnType.all

  	@i_column_datas = []
  	@i_column_datas = IColumnData.where(i_column_type_id: column_type) if column_type.present?
  end

end
