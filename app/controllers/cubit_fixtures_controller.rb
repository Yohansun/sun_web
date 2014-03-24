# -*- encoding : utf-8 -*-
class CubitFixturesController < ApplicationController

  def create
    if params[:cubit_fixtures]
      fixtue = CubitFixture.new(params[:cubit_fixtures])
      if fixtue.save
        # params all valid in modal
        SendSmsCubit.perform_async(params[:cubit_fixtures][:area_id], params[:cubit_fixtures][:fixture_area], params[:cubit_fixtures][:fixture_type], params[:cubit_fixtures][:house_name], params[:cubit_fixtures][:phone], fixtue.id)
        render :js => "alert('恭喜您提交信息成功！丘比特已向iColor优秀设计师发送您的装修需求，同时已将推荐的设计师名单发送至您的手机，请保证电话畅通以便设计师联络您！');location.reload();"
      else
        render :js => "alert('*号为必填项,所在地必须到区!');"
      end
    else
      render :js => "alert('*号为必填项,所在地必须到区!');"
    end
  end
end