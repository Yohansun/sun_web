# -*- encoding : utf-8 -*-
class CubitFixturesController < ApplicationController

  def create
    if params[:cubit_fixture]
      fixtue = CubitFixture.new
        if fixtue.update_attributes(params[:cubit_fixture])
          Notifier.cubit_fixture(fixtue.id).deliver
          render :js => "alert('谢谢您的参与！ 丘比特将在3个工作日内向您推荐3家同城优秀家装公司！');location.reload();"
        else
          render :js => "alert('*号为必填项,所在地必须到区!');"
        end
    end
  end
end
