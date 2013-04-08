# -*- encoding : utf-8 -*-
class CubitFixturesController < ApplicationController

  def create
    if params[:cubit_fixture]
      fixtue = CubitFixture.new
        if fixtue.update_attributes(params[:cubit_fixture])
          render :js => "alert('提交成功');location.reload();"
          Notifier.cubit_fixture(fixtue.id).deliver
        else
          render :js => "alert('*号为必填项,所在地必须到区!');"
        end
    end
  end
end
