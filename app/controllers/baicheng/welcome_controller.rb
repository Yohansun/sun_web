# -*- encoding : utf-8 -*-
class Baicheng::WelcomeController < ApplicationController
  layout 'baicheng'

  def index
  	@title = "icolor""因爱之名 刷新生活""活动携手万名设计师免费提供装修设计图，设计您的新家。-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
  	@description = "立邦icolor因爱之名刷新生活活动，家装者上传房型图，万名设计师免费提供装修设计图，上传作品参加活动奖项评选，赢刷新大奖。"
    @key_words = '立邦刷新生活,免费装修设计,装修设计图,icolor设计大奖'
  end

  def show
  	@title, @description = "", ""
  	case params[:page]
  		when "jump"
  			@title = "大众用户轻松三级跳-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
	  		@description = "立邦icolor刷新百城设计案例征集评选活用户参与步骤，注册登录、免费咨询、参与活动。"
  		when "pk"
	  		@title = "家装公司设计师作品PK-立邦 iColor 装修设计鉴赏、设计师作品欣赏、访谈"
	  		@description = "快速上传立邦icolor刷新百城设计案例征集评选活作品。"
            when "disclaimer"
              @title = ""
              @description = ""
  	end

    render "#{params[:page]}"
  end
end
