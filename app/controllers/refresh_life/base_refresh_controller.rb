class RefreshLife::BaseRefreshController < ApplicationController
	layout "home_manage"
	before_filter :get_data

  def get_data
    @design_datas = IColumnData.where(i_column_type_id: 2).limit 5
    @weekly_star_datas = IColumnData.where(i_column_type_id: 3).limit 5
    @master_design_datas = IColumnData.where(i_column_type_id: 1).limit 5
  end

end
