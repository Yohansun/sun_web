# -*- encoding : utf-8 -*-
class CubitFixturesController < ApplicationController

  def create
    if params[:cubit_fixtures]
      fixtue = CubitFixture.new(params[:cubit_fixtures])
      if fixtue.save
        Notifier.cubit_fixture(fixtue.id).deliver
        render :js => "alert('谢谢您的参与！ 丘比特将在3个工作日内向您推荐3家同城优秀家装公司！');location.reload();"
      else
        render :js => "alert('*号为必填项,所在地必须到区!');"
      end
    else
      render :js => "alert('*号为必填项,所在地必须到区!');"
    end
  end
end
