# -*- encoding : utf-8 -*-
class CubitFixturesController < ApplicationController

  def create
    if params[:cubit_fixtures]
      fixtue = CubitFixture.new(params[:cubit_fixtures])
      if fixtue.save
        # params all valid in modal
        SendSmsCubit.perform_async(params[:cubit_fixtures][:area_id], params[:cubit_fixtures][:fixture_area], params[:cubit_fixtures][:fixture_type], params[:cubit_fixtures][:house_name], params[:cubit_fixtures][:phone], fixtue.id)
        render :js => "alert('谢谢您的参与！ 丘比特将在3个工作日内向您推荐3家同城优秀家装公司！');location.reload();"
      else
        render :js => "alert('*号为必填项,所在地必须到区!');"
      end
    else
      render :js => "alert('*号为必填项,所在地必须到区!');"
    end
  end
end
