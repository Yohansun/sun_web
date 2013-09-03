class RefreshLife::BaseRefreshController < ApplicationController
	layout "home_manage"
	before_filter :get_data

  def get_data
  	@design_more = IColumnData.where(i_column_type_id: 2, position: 0).first
  	@weekly_star_more = IColumnData.where(i_column_type_id: 3, position: 0).first
  	@master_design_more = IColumnData.where(i_column_type_id: 1, position: 0).first
    @design_datas = IColumnData.where(i_column_type_id: 2).limit 5
    @weekly_star_datas = IColumnData.where(i_column_type_id: 3).limit 5
    @master_design_datas = IColumnData.where(i_column_type_id: 1).limit 5
  end

end
